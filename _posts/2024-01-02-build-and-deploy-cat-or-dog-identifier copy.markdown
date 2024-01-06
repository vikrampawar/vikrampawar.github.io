---
title:  Build and Deploy a Cat or Dog identifier
published : true
description : 
tags: #fastai #llm ##classifier 
layout: post
categories: #fastai #llm #classifier
date:   2024-01-02 18:15:00 +0000
---

I've recently started exploring AI and machine learning. I found this course by FastAI called [Practical Deep Learning](https://course.fast.ai/). I'm going through this course now. 

One of the first things I learned is how to build a model and deploy it to a website. In this post, I'll document the steps we can take to build and deploy an AI model that identifies whether an image is that of a cat or a dog.
The end result will be a web application that will allow users to upload an image and the application will identify whether the image is that of a cat or a dog. 

Here is a link to the completed web application [Cat or Dog Identifier](https://huggingface.co/spaces/bhetal/cats_or_dogs_identifier).

![](2024-01-03-20-15-58.png)

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

We'll open an account on Hugging Face, if we don't already have it and then go to [spaces](https://huggingface.co/spaces) to create a new space. We'll Select `Gradio` as the SDK and the free option for hardware. It will show the steps to follow. 

Each space has its own git repository. It contains a file called `app.py`. This is the file that contains the code for the web application.
We'll clone the repository to our local machine, create a the default `app.py` as suggested on the page and push it to the repository. This will trigger a build on Hugging Face. Once the build is complete, we'll be able to access the web application from the URL provided by Hugging Face.

To be able to push changes to it, we should have access. We can either use Access Tokens or SSH keys. I prefer SSH keys. To generate an SSH key, we can follow the steps from Github [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh). Once we have the SSH key, we can add it to your Hugging Face SSH keys tab on the profile page.

![](2024-01-03-09-14-59.png)

## Deploy the web application to Hugging Face

Now we have a way to deploy the web application, we'll update the `app.py` to run our application. For this, we'll have to extract and copy the relevant code from the notebook we created earlier. 

Our `app.py` file has the below code
```py
from fastai.vision.all import *
import gradio as gr

# determines if it's a cat from first letter
def is_cat(x): return x[0].isupper() 

# load the model 
learn = load_learner('model.pkl')

categories = ('Dog', 'Cat')

def predict(img):
    pred,pred_idx,probs = learn.predict(img)
    return dict(zip(categories, map(float, probs)))

# show it in a gradio interface
examples = [ 'cat1.png', 'dog1.png', 'python1.png']
gr.Interface(fn=predict, inputs=gr.Image(), outputs=gr.Label(), examples=examples).launch()

```

We'll also have to install the libraries we used in the notebook. We can do this by adding the following lines to the `requirements.txt` file.


```
fastai
scikit-image
```
We'll copy the `model.pkl` file to the repository. 

The `model.pkl` files are usually large. So, we'll have to use [git-lfs](https://git-lfs.github.com/) to push it to the repository. You can find the steps to install and use git-lfs [here](https://vikrampawar.github.io/2024/01/03/using-git-lfs.html).

You should have the following files in the repository. Note that the `.png` files are the examples we'll use to test the application. We'll then push the changes to the repository.


 This will trigger a build on Hugging Face. Once the build is complete, we'll be able to access the web application from the URL provided by Hugging Face. You can also see all the files that make up the web application from the files tab.

![](2024-01-03-20-26-54.png)

Happy coding!