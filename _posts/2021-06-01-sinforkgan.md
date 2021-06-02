---
layout: post
title: SinForkGAN
categories: Python
tags: []
excerpt:
---
# ForkGAN with Singel Rainy Night Images: Leveraging the RumiGAN to See into the Rainy Night

By Seri Lee, Department of Engineering, Seoul National University

This repository contains the code for train and test SinForkGAN model.
This project was conducted as a final project for the course "Advanced GANs" in Seoul National University.
For more information about the course, please refer to our [instructor](https://github.com/yunjey)'s github page.

Full running code will be provided after acceptance.
Sorry if the code is messy and unorganized. It will be reorganized very soon :)

- [Project Page](https://sites.google.com/snu.ac.kr/sinforkgan/overview)
- [Paper](https://sites.google.com/snu.ac.kr/sinforkgan/overview)(will be available soon)

## Table of contents 
1. [Overview](#1)
3. [Dataset](#2)
4. [SinForkGAN Model](#3)
5. [Dependency](#4)
6. [Install](#5)
7. [How to use](#6)
8. [Evaluation Metric](#7)
9. [Downstream Tasks](#8)
10. [Reference](#9)
11. [Contact](#20)

<a name="1"></a>
## Overview



<a name="2"></a>
## Dataset
SinForkGAN model is built upon 4 different night/rainy dataset. 

1. **Dark Zurich Dataset** (ICCV 2019): provides 2,416 nighttime images along with the respective GPS coordinates
of the camera for each image used to construct cross-time correspondences for evaluation on localization task.
![Screen Shot 2021-06-02 at 5 16 43 AM](https://user-images.githubusercontent.com/38284936/120384908-b91f1c80-c361-11eb-8a65-0482b602fbbb.png

2. [**RaidaR**](https://sites.google.com/site/alimahdaviamiri/projects/raidar) (CVPR 2020): a rich annotated dataset of rainy street scenes. 5,000 images provide semantic segmentations
and 3,658 provide object instance segementations. 
![Screen Shot 2021-06-02 at 5 18 49 AM](https://user-images.githubusercontent.com/38284936/120385155-04d1c600-c362-11eb-9228-17d3c15f33ba.png)

3. [**BDD100K**](https://bair.berkeley.edu/blog/2018/05/30/bdd/) (CVPR2017): 100,000 video clips in multiple cities, weathers and multiple times of day. 27,971 night images for training and 3,929 night images for evaluation.
![Screen Shot 2021-06-02 at 5 20 07 AM](https://user-images.githubusercontent.com/38284936/120385292-32b70a80-c362-11eb-9453-c90de3d061ce.png)

4. **ExDark** (CVIU 2018): 7,7863 low-light images from very low-light environments to twilight with 12 object classes annotated on local object bounding boxes. 
![Screen Shot 2021-06-02 at 5 21 12 AM](https://user-images.githubusercontent.com/38284936/120385413-5a0dd780-c362-11eb-919a-cea64d9acd75.png)

<a name="3"></a>
## SinForkGAN Model
SinForkGAN model effectively learns and tests nighttime rainy images and translates them into standard daytime images in an unsupervised way. Note that this model is designed for subsequent computer vision task (e.g. image retrieval, localization, semantic segmentation, object detection) rather than human vision. Some noise that are crucially degrading for machine vision might not be for the natural eye. 

It also differs from single image dehazing/denoising methods in that it is trained and tested on real-world dataset. Unsupervised single image dehazing/denoising methods tend to fail under real-world circumstances where noises are different from synthetic dataset, and our problem setting (e.g. rainy night) is a much more challenging setting than just simple image denoising. 

We improve upon SinForkGAN 
![figure2](https://user-images.githubusercontent.com/38284936/120337731-890a5600-c32e-11eb-8a48-d105970db88b.jpg)

<a name="4"></a>
## Dependency

Python (3.6) is used for training and testing.

<a name="5"></a>
## Install
### For Linux System
```
git clone --recurse-submodules (this repo)
cd $REPO_NAME/code
(use python >= 3.6)
python3 -m venv sinforkgan-env
source sinforkgan-env/bin/activate
pip3 install -r requirements.txt
```
Place the data folder at `$REPO_NAME/datasets'

## Data Folder Structure

Please place the data folder like the following structure.
We change and modify the structure of each dataset using only nighttime/rainy images.
For example, for RaidaR dataset, we only use `0.Rainy` dataset for testing and do away with the folder `1.Sunny`.
```
code/
  main.py
  ...
datasets/
  bdd100k/
   train/
    class_color/
     ...
    raw_images/
     0a1a0c5d-8098f13f.jpg
     ...
   val/
    class_color/
     ...
    raw_images/
     ...
  dark-zurich/
   train/
   val/
    ...
    GOPRO0356_000488_rgb_anon.png
  ex-dark/
    ...
    Bicycle/
    ...
     2015_06850.jpg
    Boat/
    ...
  raidar/
   Part1/
    Part1.1/
     00001593/
      00001593.jpg
   ...
   Part2/
   ...
```

(More information will be provided soon)

<a name="6"></a>
## How to use

### Training 
```
cd code/SinForkGAN 
python3 main.py --phase train --dataset_dir ../../data/bdd100k/train/raw_images
```

### Evaluation

All the pretrained weights are planned to be provided.
If you don't have the pretrained weights provided or trained in the `./code/SinForkGAN/ckpt` directory,
please download them [here](https://sally20921.github.io/weights/README.md)

```
cd code/SinForkGAN
python3 main.py --phase test --dataset_dir ../../data/dark-zurich/val --checkpoint_dir ./ckpt/bdd100k.pth
```

### Demo 

For simple image translation demo, run
```
cd code/SinForkGAN
python3 main.py --phase test --dataset_dir ../../data/ex-dark/People --checkpoint_dir ./ckpt/bdd100k.pth
```

You can view the translated file in the terminal using `imgcat` in `./test` directory.
```
cd test
./imgcat results/(name/of/file.png)
```

<a name="7"></a>
## Evaluation Metric 
- mIoU: Intersection-over-Union(IoU) measures the overlap between predicted segmentation map and the ground truth, divided by their union. In the case of multiple classes, we take the average of IoU of all classes (i.e., mIoU) to indicate the overall performance of the model. 


<a name="8"></a>
## Downstream Tasks
### Image Localization/Retrieval
We use SIFT algorithm for keypoint detection. Opencv provides a ready-to-use SIFT module. More information about cv::SIFT can be found [here](https://docs.opencv.org/3.4/d7/d60/classcv_1_1SIFT.html). The SIFT detector uses DoG and  4 octaves starting with a two times up-sampled version of the original image, 3 scales per octave, a peak threshold of <img src="https://render.githubusercontent.com/render/math?math=\frac{0.002}{3}">, an edge threshold of 10, and a maximum of 2 detected orientations per keypoint location. These values have been optimized for the purpose of SFM and are, e.g., used as defaults in COLMAP.

#### Pipeline
1. Detect keypoints using SIFT Detector, compute the descriptors
2. Matching descriptor vectors with a BF based matcher 
3. Filter matches using the Lowe's ratio test (ratio_thresh = 0.7)
4. draw matches 

![figure3](https://user-images.githubusercontent.com/38284936/120337773-93c4eb00-c32e-11eb-8ae8-7b511ed8b03e.jpg)


### Semantic Segmentation
DeepLabV3 model pretrained on the Cityscapes dataset is used for the semantic segmentation task. The source code that we used for this task has been deleted, unfortunately. We will soon find an alternative for testing. 

Raidar dataset can be downloaded [here](https://github.com/aarezzou/RaidaR)
![figure4](https://user-images.githubusercontent.com/38284936/120388485-216ffd00-c366-11eb-8a70-274ec6b337a3.png)

BDD100K dataset can be downloaded [here](https://bdd-data.berkeley.edu/)
![figure5](https://user-images.githubusercontent.com/38284936/120388496-2339c080-c366-11eb-8e3e-eba45f78b434.png)



### Object Detection
YOLOv3-tiny model pretrained on the PASCAL VOC 2007 + 2012 dataset is used for the object detection task. Source code can be found [here](https://github.com/sally20921/YOLOv3-PyTorch). mAP is measured at .5 IOU. The author of [YOLOv3](https://pjreddie.com/darknet/yolo/) notes that you can easily tradeoff between speed and accuracy by changing the size of the model. We choose the YOLOv3-tiny for our purpose. We set the detection threshold to 0.5.

<img width="1445" alt="figure6" src="https://user-images.githubusercontent.com/38284936/120337857-a7705180-c32e-11eb-9b76-fb7d6c4ea88d.png">

<a name="9"></a>
## Reference
```
@inproceedings{jin2021,
      title={RaidaR: A Rich Annotated Image Dataset of Rainy Street Scenes}, 
      author={Jiongchao Jin and Arezou Fatemi and Wallace Lira, Fenggen Yu, Biao Leng, Rui Ma, Ali Mahdavi-Amiri, Hao Zhang},
      year={2021},
       booktitle={},
pages={??--??}
}

@misc{xu2017endtoend,
      title={End-to-end Learning of Driving Models from Large-scale Video Datasets}, 
      author={Huazhe Xu and Yang Gao and Fisher Yu and Trevor Darrell},
      year={2017},
      eprint={1612.01079},
      archivePrefix={arXiv},
      primaryClass={cs.CV}
}

@InProceedings{zheng_2020_ECCV,
  author = {Zheng, Ziqiang and Wu, Yang and Han, Xinran and Shi, Jianbo},
  title = {ForkGAN: Seeing into the Rainy Night},
  booktitle = {The IEEE European Conference on Computer Vision (ECCV)},
  month = {August},
  year = {2020}
}
```
ForkGAN [paper](https://github.com/sally20921/SinForkGAN/files/6580597/forkgan.pdf)[github](https://github.com/zhengziqiang/ForkGAN)
ToDayGAN [paper]()[github]()
EnlightenGAN [paper]()[github]()
RumiGAN[paper]()[github]()
YOLOV3-tiny [github]((https:// github.com/Lornatang /YOLOv3-PyTorch)

<a name="10"></a>
## Contact Me

To contact me, send an email to sally20921@snu.ac.k
