 # Retraining
 
 ## Creating model with `retrain.py`
 
 Download `retrain.py`:
 
 ```bash
 $ curl -LO https://github.com/tensorflow/hub/raw/master/examples/image_retraining/retrain.py
 ```
 
 Run it on a folder of training data:
 
 ```bash
 $ python retrain.py --image_dir ~/flower_photos
 ```
 
 ## Using the model
 
 Download `label_image.py`: 
 
 ```bash
 $ curl -LO https://github.com/tensorflow/tensorflow/raw/master/tensorflow/examples/label_image/label_image.py
```
Run it on the saved model files:

```bash
python label_image.py \
--graph=/tmp/output_graph.pb --labels=/tmp/output_labels.txt \
--input_layer=Placeholder \
--output_layer=final_result \
--image=$HOME/flower_photos/daisy/21652746_cc379e0eea_m.jpg
```

## `saved_model_cli`

 the following command shows all available MetaGraphDef tag-sets in the SavedModel:

```bash
$ saved_model_cli show --dir /tmp/saved_model_dir
The given SavedModel contains the following tag-sets:
serve
serve, gpu
```

The following command shows all available SignatureDef keys in a MetaGraphDef:

```bash
$ saved_model_cli show --dir /tmp/saved_model_dir --tag_set serve
The given SavedModel `MetaGraphDef` contains `SignatureDefs` with the
following keys:
SignatureDef key: "classify_x2_to_y3"
SignatureDef key: "classify_x_to_y"
SignatureDef key: "regress_x2_to_y3"
SignatureDef key: "regress_x_to_y"
SignatureDef key: "regress_x_to_y2"
SignatureDef key: "serving_default"
```

To show all available information in the SavedModel, use the --all option. For example:

```bash
$ saved_model_cli show --dir /tmp/saved_model_dir --all
MetaGraphDef with tag-set: 'serve' contains the following SignatureDefs:

signature_def['classify_x2_to_y3']:
  The given SavedModel SignatureDef contains the following input(s):
    inputs['inputs'] tensor_info:
        dtype: DT_FLOAT
        shape: (-1, 1)
        name: x2:0
  The given SavedModel SignatureDef contains the following output(s):
    outputs['scores'] tensor_info:
        dtype: DT_FLOAT
        shape: (-1, 1)
        name: y3:0
  Method name is: tensorflow/serving/classify
```
