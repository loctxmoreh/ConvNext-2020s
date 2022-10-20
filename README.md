# [Moreh] Running on HAC
![](https://badgen.net/badge/Nvidia-A100/passed/green)

ConvNeXt implementation in Tensorflow

## Prepare

### Code
```bash
git clone https://github.com/loctxmoreh/ConvNext-2020s
cd ConvNext-2020s
```

### Data
Download the dataset from [here](https://storage.googleapis.com/mledu-datasets/cats_and_dogs_filtered.zip).
Extract and symlink it to `./data`

### Environment
Create a conda environment using the `a100env.yml` file:
```bash
conda env create -f a100env.yml
conda activate convnext-tf
```

## Run
Run the training script:
```bash
./a100-train
```

Edit the script to change parameters:
- `--image-size`
- `--lr`
- `--batch-size`
- `--model`: convnext model configuration, can be `tiny`, `small`, `base`, `large`, `xlarge`
- `--epochs`
