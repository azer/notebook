# PostgreSQL

These notes were taken in 2009 in a session organized by [Devrim Gündüz](https://people.planetpostgresql.org/devrim/).


YARDIM ALMAK
------------
  fonksiyonlar hakkinda yardim almak:
    insert into t1 select generate_series(1,500);
    \df 
  http://postgresql.org/docs/books/volkanyazici


CREATE OPERATOR
----------------


TRANSACTION
-----------
ACID UYUMLUDUR:
  ATOMICITY: transaction ya tamamlanir ya da rollback olur
  CONSISTENCIY: tutarlilik.db datasinin tutarli oldugu garanti edilir.
  ISOLATION: farkli oturumlar diger oturumlarda devam eden transactionlari goremez.
  DURABILITY: istemciden client'a transactionin bittigi bilgisi verildiginde o andan itibaren transaction etkisi devam etmelidir.

BEGIN;
SAVEPOINT A;
.
.
.
SAVEPOINT B;
.
.
.
ROLLBACK TO SAVEPINT A; -- BU DURUMDA SPB UCACAK!
RELEASE SAVEPOINT A; -- savepointi kaldiriyor
DELETE;
COMMIT/ROLLBACK;


NAMESPACES
-----------
ontanimli namespaceler:
 information_schema
 public,
 pg_toast
 pg_toast_temp_1
 pg_catalog
deneyelim;
create schema azer;
set search_path to public,azer;
drop schema azer cascade -- cascade basamaklamak demek, basamaklayarak kaldir!

secilen namespace in icerigini nasil listeleriz?


SEQUENCE
---------
bir sequence'in degeri, ona yapilan her erisimde artar
tablo olustururken serial tipi secilirse, integer olarak gecer ve bu kolona otomatik sequence olusturulup atanir.
sequence manual girilen degerle cakisirsa? cok ta onemli degil
select * from t2_c1_seq;
nextval: sequence degerini artirir ve dondurur, oturumda daha once erisilmesi onemli degil
currval: mevcut degeri dondurur, onceden erisilmesi lazim
lastval: son degeri getirir, 8.4 de geliyur
setval: manual olarak degistirmeyi saglar

sequence olusturalim:
  CREATE SEQUENCE s1 INCREMENT 10 START 20;
  nextval('s1');
  ALTER SEQUENCE s1 RENAME TO 'asasd'
sequence'i atamak:
  create table t3(c4 integer default nextval('sequence1'));


FONKSIYONLAR
-------------
fonksiyon yazalim:
  topla:
    CREATE FUNCTION topla(int,int) RETURNS int AS
    $$
      SELECT $1+$2;
    $$
    LANGUAGE 'SQL'
  x:
   CREATE FUNCTION x(bigint) RETURNS bigint AS
   $$
     SELECT count(payment.customer_id) FROM payment JOIN customer ON (customer.customer_id=Payment.customer_id) 
     WHERE payment.customer_id = $1;
   $$
   LANGUAGE 'SQL';


KONSOL ARACLARI
---------------
createdb azer -p 5433
dropdb
createlang plpgsql pagila


ERISIM KONTROL MEKANIZMASI
--------------------------
1.Kullanici (ROLE) yaratmak
2.Erisim Mekanizmasini duzenleme
  8.1 den sonra role kavrami cikti.Kullanicilar role'lerin altina yerlestiriliyor.
  MUHASEBE ROLE           YONETIM
    - semra                 - mavci
    - mavci
  simdi bir kullanici acip izin vermeye calisalim;
    CREATE ROLE azer;
    ALTER ROLE azer LOGIN; # login hakki verildi.diger haklari manualde gorebilirsin
  pg_hba.conf'ta ident sameuser yerine 'trust' yazmak gerekli.
  mevcut veritabanina baska bi kullaniciyla baglanmak istersek;
    \c - azer

  bir kullaniciya, bir tablo icin tum haklari vermek;
    GRANT ALL ON film TO azer;
    REVOKE ALL ON film FROM azer;
    DROP OWNED BY azer; # bu komut, azer in tum haklarini siler arti sahibi oldugu tablo varsa sahipsiz kalmamalari icin onlari da kaldirir
  
  birden fazla role'un altina koyma:
    CREATE ROLE mavci IN ROLE muhasebe,yonetim
  
  * inherit, kullanicinin ust role unden alacagi haklari ozel olarak duzenlemeyi saglar.
  * baglantida ilk eslesen kural gecerli olur.
  * PG_HBA.CONF Dosyasi:
                                     db:         user:            ip,network:       yetkilendirme:
    local,host,hostssl,hostnossl     all,azer    all,mavci        127.0.0.1/32      trust; herseyi kabul et
                                                                                    password: unencrypted password
                                                                                    md5: encrypted password
                                                                                    reject: kabul etme
                                                                                    pam:
                                                                                    ldap, ldaps: 


TABLESPACE
----------
  * tablespace in icinde herhangi bir nesne tutmak mumkundur
  olusturmak icin:
    CREATE TABLESPACE azer LOCATION '/var/lib/postgresql/tablespace';
  listelemek icin:
   \db
  tablo olustururken tablespace kullan;
    CREATE TABLE x() TABLESPACE azer
  olusturulani tasimak;
    ALTER TABLE x SET TABLESPACE azer;
  tasima esnasinda bu tablo kilitlenir.
  tablolari listelerken hangi tablespace de olduklarini nasi goruruz?
  tablonun hangi namespace te oldugnu ogrenmek icin;
    \d film;
  veya;
    select tablename,tablespace FROM pg_tables WHERE schemaname='public';
    \db

TEMP TABLE
----------
  gecici tablo olusturmak icin kullanilir.dezavantaji: her halukarda diske erismek gerekir.cozum bunu
  ram disk e atmaktir.

  linux ta 16 adet ramdisk var; ls /dev/ram*. ram0 disindakiler kullanilabilir.veya kendimiz ramdisk yaratabiliriz;
  klasik device yaratma komutu:
     mknod -m 0 /dev/pgramdisk b 1 1
     mkfs.ext3 /dev/pgramdisk
     mount /dev/pgramdisk /pgramdisk/

POSTGRESQL IN SQL TUMCELERI
---------------------------
  * commit eventleri tanimlamak:
    create temp table azer() on commit delete rows;
                                       drop;
                                       preserve rows;

  * check constrait:
    create table t1 (y int CHECK(yas<25))
  
  * sonradan column eklemek:
    ALTER TABLE t1 ADD c2 VARCHAR(20);

  * baska bi tabloyu kopyalamak:
    CREATE TABLE yeni () AS SELECT ..... FROM ESKI;

  * LIKE/ILIKE:
      SELECT description FROM film WHERE title LIKE '^y';
      SELECT description FROM film WHERE title ~ '^y';

      SELECT description FROM film WHERE title ILIKE '^y';
      SELECT description FROM film WHERE title ~* '^y';

  * VIEW:
      CREATE VIEW titils AS select title FROM film;
  * GETTING ID OF INSERTED DATA:
      INSERT INTO t1 VALUES (DEFAULT) RETURNING id;
  * GENERATE SERIES;
      insert into t1 select generate_series(1,500);
  * psql'in calistirdigi query'leri gostermek:
    psql -E


MULTI VERSION CONCURRENCY CONTROL: 
----------------------------------

pgsql bir satirin birden fazla surumunu tutar!
   silinen veya degistirilen satirlar dead tuple olarak saklanmaya devam eder.dead tuple'lar 
   isaretlendigi icin normal sorguda donmez, live tuple'ar doner.dead tuple'lar gittikce birikir
   ve cozulmesi gereken bir sorun haline gelir.
   
   TRUNCATE:
     TRUNCATE tablodaki tum satirlari siler (dosyayi silip yeni tablo yaratir), tabloyu taramaz.DELETE ise
     butun visibility ozelligini tek tek kapatir.
     
     tabi truncate sequence'i etkilemiyor.bunun icin 8.4 de gelen 'TRUNCATE table RESTART IDENTITY'


INDEXLER
--------
* index olusturmak:
    CREATE INDEX t1_c1_idx ON T1(c1,c2...);

  * PROBLEM:
      t1
      ---------
      c1 index
      c2 index
      c3 varchar(20) index
 
      - WHERE c1<20 AND c2<90;
      burada c1 ve c2 icin iki ayri index olusturmak yetmez.bu ikisi icin ortak index olusturmak gerekir.
      - WHERE upper(c3) = 'AZER'
      bu da index kullanamaz.
        - COZUM:
          CREATE INDEX c4 ON t1(upper(c3));

  * EXPRESSIONAL INDEX:
      - sorgumuz su:
          t1 WHERE (ad || '' || soyad) = 'devrim gunduz'
      - bu kez index su olur:
          ( (ad || ' ' || soyad) )

  * PARTIAL INDEX:
     yas < 26 -- 20 milyon sonuc dondugunu farzedelim, su index gerekir:
      ON t1(yas) WHERE yas<26;

  * INDEX CESITLERI:
     - postgres default olarak b-tree(btree) index kullanir
     - custom index tipi soyle kulzamanda lanilir:
         ON t1 USING btree(t1); (esitlikler, yuzdeli buyuk kucuk sorgulara btree index birebirdir)
     - 'hash' index ise esitlik operatorunde kullanilir.veri kurtarirken index'i tekrar olusturmak gerekir, postgres onermiyor.transaction log'a yazilmiyor.
     - gist ve gin (generilazed iNverted (gin index) index) denen iki index daha var.sadece postgres'de vardir bunlar, full text search te kullanilir. gist'ler ayni zamanda cografi uygulamalarda kullanilir.full text search te kullanilir muthis hizlidir.

  * GEREKSIZ INDEXLERIN BULUNUP KALDIRILMASI COK ONEMLI.
    - sorgu planlama suresini artiririz.
    - disk alanindan kazaniriz
    - gereksiz update leri engelleriz
    - bakim gereksinimini azaltir
    - yedekleme geri yukleme hizi

  * INDEX KULLANIMLARI ISTATISTIK ICIN KAYDEDILIR.
    devrimin gonderecegi notlarda istatistigi sorgulamak icin gerekli sorgular var.
  
  * BIR TEST VE SONUCU:
  ```
      pagila2=EXPLAIN select * from rental where rental_id < 10;
                                      QUERY PLAN                                 
      ---------------------------------------------------------------------------
       Index Scan using rental_pkey on rental  (cost=0.00..8.32 rows=4 width=36)
         Index Cond: (rental_id < 10)
      (2 rows)
  ```
  * FILLFACTOR KAVRAMI
    postgres verileri 8k lik bloklarda saklar.insert agirlikli islemler icin blogun fillfactor
    degeri %90 (varsayilan deger budur), update agirlikli ise %30 iyidir.hic insert yoksa 10% daha iyidir.

    soyle ayarlanir:
      CREATE INDEX.. ON (a) WIDTH(fillfactor=40)
      ALTER INDEX foo SET(fillfactor=90)


INHERITANCE
-----------
 - create table ogrenciler(no serial unique,ad varchar(30));
 - create table baskanlar(sinif varchar(30)) INHERITS(ogrenciler);
 ogrencileri listeleyince, baskanlardaki data da listelenir, mantik class inheritance dan biraz farkli.
 - ALTER TABLE ogrenciler ALTER COLUMN ad TYPE varchar(120);
 - baskanlarla ogrencilerin column tipi ayni anda degisir.
 
 - super table uzerinden insert yapmak mumkun mu?


PARTITIONING (CONSTRAINT EXCLUSION) (BOLUMLEME!)
------------------------------------------------
Bu islem inheritance uzerinden yapilmistir.data aging, verinin yaslandirilmasidir.
  CREATE TABLE
  - log (id serial,logdate timestamp,log text)
  - log_2009_01() INHERITS log;

log_2009_01 tablosuna veri kaydetme kuralini olusturalim:
  - ALTER TABLE log_2009_01 ADD CONSTRAINT tarih_kontrol
    CHECK ( logdate >= '2009-01-01' AND logdate < '2009-02-01' )
  benzer hareketler:
    CHECK (soyad ~* '^[a-c]')
    CHECK (soyad between '^a' AND '^c') -- buyuk kucuk harf farkmiyor

devrim soru soruyor:
  part1: check(id BETWEEN 1 AND 50)
  part2: check(id BETWEEN 50 and 100)
  50 hangisine girecek? ikisine de girer.between 50'yi iki sartta da dahil ediyur.

postgres bir sorguyu hangi asamalardan gecirir:
  1) Rewrite: sorgu yeniden yazilir, onemsiz hatalar duzeltilir.bu asamayi degistiren bi baska unsur RULE dur.
  2) Parser: syntax kontrolu yapar, parse eder
  3) Planner: sorgunun planini cikarir.explain
  4) Executer: sorguyu execute eden asama

bolumleme iki sekilde yapilir: rule ile ve trigger ile.
haydi bir rule olusturalim:
  - CREATE RULE foo ON INSERT TO log
    WHERE (logdate<'2009-02-01' AND logdate>'2009-01-01')
    DO INSTEAD
    INSERT INTO log_a VALUES(NEW.id,NEW.logdate,NEW.log);
  - her bir rule'a bir do instead yaziliyor.
    - new operator insert yerine select veya update yazilirsa nolur? 
    - OLD DA VAR.

partition ozelligini acmak icin:
SET constraint_exclusion TO on;

  VACUUM
------------

o rule'a gore 2009_01 e yazmistik, peki update deyip 02 yaparsak ne olur? check constrait kuralina takilir.bu durumda
silip yeniden insert etmek gerekecektir! bunu transaction icinde yapmak unutulmamalidir!



auto partitioning 8.5 de gelecekmis.


STATISTICS COLLECTOR
--------------------
Postmaster altinda calisan, postgres olarak gorunen, veritabani istatistiklerini toplayan prosestir.ayri bir surec olarak calisir.
parametreler:
  - track_counts: tablolarin ve indexlerin istatistiklerin toplanip toplanmayacagini belirtir. RELOAD
  - track_activities: sunucuda isletilen komutlarin anlik olarak gosterilmesini saglar RELOAD
  - track_functions: kullanici tanimli fonksiyonlarin istatistikleri verilir RELOAD
  - track-activity-query-size: track aktivities ile takip edilebilecek sorgularin bellek miktarini ayarlariz.(8,4 de geliyor) RESTART
  - log_parser_stats
  - log_planner_stats
  - log_executer_stats
  - log_statement_stats: hepsini loglar. ustteki 3lu aciksa st acilamaz.acilirsa digerleri acilmaz.

  istatistik viewlari:
    - select * from pg_stat_activity;
     
    - pg_stat_*_** >>
      * user, sys, all
      ** tables,indexes,sequences

    - pg_statio_*_** >>
      * user, sys, all
      ** tables,indexes,sequences
    
    - bg_stat_bgwriter;

    - bg_class:
        bu tablodaki relkind, index tipini tutar:
           tablo  r
           index  i
           seq    s
           view   
           compos c
        reltuples, kac iliskili satir yazildigini tutar
        relpages, kac iliskili disk sayfasi yazildigini tutar
        
        bu bilgiler analyze vacuum, index yazildiginda yenilenir. insert update vs yenilemez.
        

  * payment tablosu hakkinda bilgi alalim;
      SELECT relname,
        CASE WHEN relkind='r' THEN 'Table'
             WHEN relkind='i' THEN 'Index'
             WHEN relkind='S' THEN 'Square'
             WHEN relkind='t' THEN 'toast table'
             WHEN relkind='c' THEN 'composite type'
        END AS relkind, reltuples, relpages FROM pg_class WHERE relname LIKE '%payment%';

  * select * from oid,datname from pg_database;
   oid normalde listelenmez. pagila veritabaninin dosyalarinin dizin adini verir:
   /var/lib...../main/base/$oid

  * select * from pg_stats where tablename = 'film' limit 1;
    attname: kolon
    nullfrac: null olan degerlerin digerlerine oranini verir.
    avg_width: o kolonun byte cinsinden ortalama genisligini verir. 94*1000=94kb
    n_distinct: bu deger negatifse, farkli degerlerin sayisinin toplam satir sayisina oranini gosterir.bu deger pozitifse farkli degerlerin yaklasik sayisini gosterir.-1 ise kolondaki tum degerler birbirinden farklidir.
    most_common_vals: kolondaki en yaygin valuelar
    most_common_freq: mcvals'in diger satirlara oranini (frekansini) verir
    histogram_bounds: cok kritik bir kolon.
    corrolation: korolasyonun +1 veya -1 e yakin olmasi, index taramasinin sirali taramalara gore daha ucuz ve daha tercih edilebilir olacagini gosterir

  
    default_statistics_target degeri:
    =================================
    historgramin veriyi kac parcaya bolecegi bilgisini tutar.
    devrimin yeni veritabani kurunca ilk yapacagi sey bunu 100 yapmakmis.bu istatistik toplama surecini artirir ama daha detayli sonuclarla sorgularimizi hizlandirarak bu dezavantajini fixler.

    ornek:
    pagila=# select attname,n_distinct,most_common_vals from pg_stats where tablename = 'payment_p2007_02';
     payment_id   |         -1 | 
     customer_id  |   -0.25519 | {31,454,213,267,295,329,457,526,561,27}
     staff_id     |          2 | {1,2}
     rental_id    |         -1 | 
     amount       |         12 | {4.99,2.99,0.99}
     payment_date |  -0.999135 | {"2007-02-20 08:38:55.996577","2007-02-21 07:33:16.996577"}

    pagila=# set default_statistics_target to 100;
    pagila=# set default_statistics_target to 100;
    pagila=# select attname,n_distinct,most_common_vals from pg_stats where tablename = 'payment_p2007_02';
     payment_id   |         -1 | 
     staff_id     |          2 | {1,2}
     customer_id  |   -0.25519 | {31,454,213,267,295,329,457,526,561,27,176,178,196,197,234,236,260,268,336,340,380,510,1,26,29,46,62,66,86,96,107,122,146,149,171,187,200,256,277,293,299,316,322,338,341,343,371,384,406,431,434,450,451,452,456,459,491,570,576,4,12,25,35,39,76,84,85,98,111,113,116,120,129,130,132,144,163,186,191,193,204,215,230,242,253,261,289,307,310,319,327,358,368,383,387,395,403,405,410,430}
     rental_id    |         -1 | 
     amount       |         12 | {4.99,2.99,0.99,5.99,3.99,6.99,1.99,7.99,8.99,9.99}
     payment_date |  -0.999135 | {"2007-02-20 08:38:55.996577","2007-02-21 07:33:16.996577"}

    Time: 7.623 ms



    selectivity hesaplamak
    ----------------------
    - select histogram_bounds from pg_stats where tablename = 'payment_p2007_02' and attname='customer_id';
    = ( ( 1+( 100-57/( 116-57) ) ) / 10 ) * 2312
    = 3997

    cardinality (tahmin edilen satir sayisi)
    -----------
    - cardinality = selectivity * # of tuples

   # ARASTIR: oid2name    pg_stat_user_tables:
=====================================================================================
EXPLAIN
-------

    pagila=# explain select * from payment_p2007_02;
     Seq Scan on payment_p2007_02  (cost=0.00..40.12 rows=2312 width=28)

    Time: 79.013 ms

    ROWS: satir sayisi
    width: ortalama byte genisligi
    cost: islemin zaman birimi

    pagila=# explain select * from payment_p2007_02 where customer_id<100;
     Bitmap Heap Scan on payment_p2007_02  (cost=11.37..33.41 rows=403 width=28)
       Recheck Cond: (customer_id < 100)
       ->  Bitmap Index Scan on idx_fk_payment_p2007_02_customer_id  (cost=0.00..11.27 rows=403 width=0)
             Index Cond: (customer_id < 100)

    Time: 12.369 ms


BACKUP and RESTORE
--------------------

  SQL BACKUP
  ----------
  1) pg_dump: bir veritabaninin yedegini olusturur.bir transaction icinde calisir, uzun suren 
              bir yedegin uzun suren bir transaction olacagi anlamina gelir.default olarak plain text
              yedek alir.psql ile bu yedek import edilebulur.role ve tablespace bilgisi gibi global nesnelerin yedegini alamaz.
              
              pg_dump basladiginda access share tipi lock uygulanir.islem baslamadan once snapshot alir,
              buna hot backup alabilir.postgres kararli bir yedek alabilme yetenegine sahiptir.sonradan yapilan
              degisiklikler bunu etkilemez.
              
              pg_dump pagila > pagila.dump
              pg_dump pagila -f pagila.dump
              pg_dump -Fc # binary dosya (custom format) yedekleme yapar, sikistirilir ve daha az yer kaplar.bolum bolum yuklenebilir.
              pg_dump -Ft # tar formatli cikti.pek kullanilmiyor.
              pg_dump -s # semayi yedekler
              pg_dump -a # sadece veriyi yedekler
              pg_dump -c # create ten once drop eklenir.bu guzelmis.
              pg_dump -t film,payment # tablolari yedekler
              pg_dump -n x #belirtilen namespace i yedekler.
              pg_dump -T # yedeklenmesi istenmeyen tablo girlir.ayni mevzu namespace icin de var
              pg_dump -d # copy yerine insert kullanir.

  2) pg_dump_all: o clusterdaki ne kadar db varsa hepsinin yedegini alir.custom formatta yedek almaz.
              pg_dump_all -g # globals-only # sadece role veya tablespace in yedegini alir
              pg_dump_all -d # copy yerine insert kullanir.
  
  SQL RESTORE
  -----------
  1) pg_restore: binary tipi yedekleri geri yuklemek icin kullanilir.parametreler:
      -FcT
      -Ft
      -a: sadece data
      -s: sadece db semasi
      -t: sadece table
      -n: sadece namespace
      -m: multithread yapiyor, 8.4 de gelecekmis.

  2) psql -f veya \i


 BGWRITER ve CHECKPOINT
------------------------
  - postgres'in kapatilamayan ozelliklerinden biridir.ps ciktisinda writer diye gozuken surec budur.
  - shared buffer: sureclerin ortaklasa konustugu paylasim alani.relationlar buradan yonetilir.
    bir select sorgusu yaptik diyelim, postgres bunu diskten tarayip ram'de sb'ye tasir.sorgu tekrar calistirilrsa ram'den okunur.
    veya update islemi yapmak istedik.shared buffers icindeki veriyi degistirecek bir sorgu calistirildiginda, degisen buffer diske tasinmaz.
    bellekte degisiklik yapmaya dirtying page denir.kirli sayfa eninde sonunda diske yazilmalidir.
  - shared buffers in boyutu posgres yeniden baslatilmadan degistirilmez. 
  - postgres'in sb deki verinin kaybolmamasi icin  WAL(write ahead log) korumasi vardir.

  WAL (Write Ahead Log)
  ----
  Shared buffers in butun degisiklikleri transaction log ile kaydeder.Postgreste en fazla disk hareketi tx log uzerinde olur.
  postgres duzgun kapanmazsa, tx log u okuyup, kaybedilen verileri geri kazandirir.

  CHECKPOINT
  ----------
  Checkpoint calistirildiginda tum kirli sayfalar diske yazilir sonra hepsi temizlenir.Checkpoint sirasinda ciddi miktarda io derdimiz ortaya cikar.
  8.3de checkpoint daha fazla kontrol edilebilir hale geldi, baskisi azaltildi.

  1) Kurtarma suresini kisa tutmak icin
  2) tx loglarin kapladigi disk alanini temizleyebilmek icin
  
  BACKGROUND WRITER
  -----------------
  Gorevleri;
    1) Uygun kosullar saglandiginda checkpoint yapmak.
    2) Kirli sayfalari checkpoint'ten once yazmak
       LRU (Least Recently Used - yakin zamanda az kullanilan) scan yapar.
