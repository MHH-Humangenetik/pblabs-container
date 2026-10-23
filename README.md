# pblab Container

A lightweight Docker container for [pblab](https://github.com/PacificBiosciences/pblab), fast PacBio HiFi analysis tools: `pbweave`, `pbdv`, `pbhappy`, `pbtruvari` and `pbsamoa`.

## Version

Image tags follow the upstream release tags (e.g. `20261021`). A daily workflow checks for new upstream releases and builds them automatically. Images are `linux/amd64` only, as upstream only ships x86-64 binaries.

### nextflow

Based on the default flavor (distroless, binaries only), there is an additional container available which includes some tools needed when running in a [Nextflow](https://www.nextflow.io/) workflow. To use it, prepend the tag with `nextflow-`, e.g., `nextflow-20261021`.

## Usage

```bash
docker run --rm -it ghcr.io/mhh-humangenetik/pblab:20261021 pbweave --help
```

`pbdv` on a GPU needs the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/) and `--gpus all`.

## License

See [LICENSE](LICENSE) file for details. The license only covers this container definition and not the software contained within.
