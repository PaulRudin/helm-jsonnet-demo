# helm-jsonnet-demo

This is a proof of concept illustration of how jsonnet (via ycat) can be used
as a helm post-renderer (https://helm.sh/docs/topics/advanced/#post-rendering).

## Instructions

* Clone this repo
* install ycat locally, binaries are available on github
  https://github.com/alxarch/ycat

* Check that all is working:
```sh
helm template example --post-renderer ./yj.sh
```

You should see that each k8s object has the label `foo: bar`

* Add new jsonnet files to the processors subdir. Note: 

    * The variable `x` will be bound to each k8s object generated by helm, or
      the previous processor.
      
    * Files are applied in the order that shell globbing gives. If necessary
      just use one processor, optionally importing jsonnet files from
      elsewhere.
