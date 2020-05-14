# helm-jsonnet-demo

This is a proof of concept illustration of how jsonnet (with the help of yq)
can be used as a helm post-renderer
(https://helm.sh/docs/topics/advanced/#post-rendering).


## Instructions

* Clone this repo
* install yq and jsonnet locally locally, binaries are available in both cases
  from github release pages: https://github.com/google/jsonnet/releases, https://github.com/mikefarah/yq.

* Check that all is working:
```sh
helm template example --post-renderer ./yj.sh
```

You should see that each k8s object has the labels `foo: bar` and `bar: foo`

Then modify the file processors.jsonnet as you wish. Note that in this example
each processor is applied to every k8s object in turn.

## Motivation

When consuming third party helm charts you can only modify the resulting k8s
objects to the extent that the chart author has anticipated your customisation
use case and added a suitable interface. Post renderers allow for arbitrary
changes to the k8s objects created from the chart's templates before helm
actually applies them to your cluster.
