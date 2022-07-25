# xla-test

Following along from here: https://www.tensorflow.org/xla

Generate XLA output:
```
  $ XLA_FLAGS="--xla_dump_to=/tmp/generated" TF_XLA_FLAGS="--tf_xla_auto_jit=2" ./basic-nn.py
```

