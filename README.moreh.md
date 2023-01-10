# [Moreh] Running on HAC
![](https://badgen.net/badge/Nvidia-A100/passed/green) ![](https://badgen.net/badge/Moreh-HAC/passed/green)

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

#### On A100 machine
Create a conda environment using the `a100env.yml` file:
```bash
conda env create -f a100env.yml
conda activate convnext-tf
```

#### On HAC machine
Create a conda environment using the `hacenv.yml` file:
```bash
conda env create -f hacenv.yml
conda activate convnext-tf
update-moreh --force --tensorflow
```

## Run
Run the training script:
```bash
./train.sh
```

Edit the script to change parameters:
- `--image-size`: input image size
- `--lr`: learning rate
- `--batch-size`: batch size
- `--model`: convnext model configuration, can be `tiny`, `small`, `base`, `large`, `xlarge`
- `--epochs`: number of training epochs
