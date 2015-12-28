Predicting next word in user input
========================================================
author: Igor Basov
date: December 28, 2015

Description
========================================================

<p>This app predicts next word in user input based on it's probability calculated from training documents.</p>
<p>This app uses data obtained from HC Corpora (www.corpora.heliohost.org) to build prediction algorithm.</p>
<p>It uses Markov approximation and simple backoff model to make predictions.</p>
<p>App implements a tradeoff between memory and speed efficiency at one side and correctness of predictions at another. </p>

App structure
========================================================
<p>App consists of side panel and main panel.</p>
- Side panel allows you to input a sentence or some words for program to predict next word.
- Predict button launches working algorithm to make prediction for your input.
- Main panel shows you three most probable words that seem to be the continuation of your input.

Algorithm description
========================================================

<p>Basing on Markov approximation app uses n-grams obtained from training corpus to predict next word.</p>
<p>App uses up to 3 degree of n-grams, because higher degrees cost much memory and take away a lot of efficiency.</p>
<p>Basic steps:</p>
- Find 3-grams with first two words being equal to last two words of the input, show 3 most common last words. If it's not there, go to the next step
- Find 2-grams with first word being equal to last word of the input, show 3 most common last words. If it's not there, go to the next step
- Show 3 most common words

Example
========================================================
This is an example of how application works.
![Image of working app](111.png)
<p>Having entered "what are you" in the input filed and pressed "Predict" you're shown 3 most probable words in descending order. </p>
