---
title:  Build and Deploy a Cat or Dog identifier
published : false
description : 
tags: #fastai #llm ##classifier 
layout: post
categories: #fastai #llm #classifier
date:   2024-04-02 18:00:00 +0000
---

I've recently started exploring AI and machine learning. I found this course by FastAI called [Practical Deep Learning](https://course.fast.ai/). I'm going through this course now. 

One of the first things I learned is how to build a model and deploy it to a website. In this post, I'll document the steps I took to build and deploy an AI model that identifies whether an image is that of a cat or a dog.
The end result will be a web application that will allow users to upload an image and the application will identify whether the image is that of a cat or a dog.

In the python and AI community most of the work is done in Jupyter Notebooks.
In this post, I'll be referring to the notebooks I've created for this project.

## Train the model and export it

The first notebook is called [Fastai Cats or Dogs build and export model](https://github.com/vikrampawar/cat-or-dog-identifier/blob/main/fastai_cats_or_dogs_build_export.ipynb). It's also available on Kaggle and is called [fastai cats or dogs](https://www.kaggle.com/code/vikrampawar/fastai-cats-or-dogs).

In this notebook, we'll download the images of cats and dogs from the oxford pets dataset.

We'll then divide the images into training and validation sets. These are input to the model we'll be building. The training set is used to train the model and the validation set is used to validate the model.

Training just involves showing the model the images and telling it whether the image is that of a cat or a dog. The model will then learn to identify the features that distinguish a cat from a dog. 

Validation is done by showing the model images from the validation set and asking it to identify whether the image is that of a cat or a dog. The model will then tell us whether it thinks the image is that of a cat or a dog. We'll then compare the model's prediction with the actual label of the image to determine how accurate the model is. 

To cut short the time it takes to do the training, we'll start with a model that has already been trained on a large number of images. This model is called a pre-trained model. We'll then fine tune this model to identify cats and dogs. 

Once the model is trained, we'll save it to a file called `model.pkl`. These are usually called pickle files. We'll then use this file to deploy the model to a web application.

When you execute this notebook, you'll end up with a file called `model.pkl`. This is the file we'll use in the next step.

## Create a web application that uses the model

For this, we'll use another notebook called [Fastai Cats or Dogs - Web App](https://github.com/vikrampawar/cat-or-dog-identifier/blob/main/fastai_cats_or_dogs_run_gradio.ipynb).

In this notebook, we import the `model.pkl` file we created in the previous notebook. 
We then create a function that takes an image as input and returns the prediction of the model.
We'll use this prediction to display the result on a web page.
For this, we'll make use of a library called [Gradio](https://www.gradio.app/). Gradio allows us to create a web application with just the prediction function as input.

When you execute this notebook, you'll end up with a web application that runs locally.

## Create a space on Hugging Face

Create a [new space](https://huggingface.co/spaces) on Hugging Face. Open an account first. Then click the option to create a new space. Select `Gradio` as the SDK and the free option for hardware. You'll then be shown the steps to follow.

## Deploy the model to Hugging Face

