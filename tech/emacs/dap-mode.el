# Dap-mode

Template for running a test:

```elisp
(dap-register-debug-template
  "Launch Test"
  (list :type "go"
        :request "launch"
        :name "Launch File"
        :mode "auto"
	      :program "/home/azer/Projects/__/__/____test.go"
        :buildFlags nil
        :args nil
      	:env '(("ENV_FILE" . "/home/azer/Projects/___/.env"))
        :envFile nil))
```
