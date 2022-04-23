---
layout: post
title:  "Artificial Intelligence-A Modern Approach"
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Uncertain Knowledge and Reasoning </h2>

<h3> Quantifying Uncertainty </h3>

<h4> Acting under Uncertainty </h4>

Agents may need to handle uncertainty, whether due to partial observability, nondeterminism, or a combination of the two. An agent may never know for certain what state it's in or where it will end up after a sequence of actions.

We have seen problem-solving agents and logical agents designed to handle uncertainty by keeping track of a belief state-a representation of the set of all possible world states that it might be in-and generating a contingency plan that handles every possible eventuality that its sensors may report during execution. Despite its many virtues, however, this approach has significant drawbacks when taken literally as a recipe for creating agent programs:

<ul><li> When interpreting partial sensor information, a logical agent must consider every logically possible explanation for the observations, no matter how unlikely. This leads to impossible large and complex belief-state representations. </li>
<li> A correct contingency plan that handles every eventuality can grow arbitrarily large and must consider arbitrarily unlikely contingencies. </li>
<li> Sometimes there is no plan that is guaranteed to achieve the goal-yet the agent must act. It must have some way to compare the merits of plans that are not guaranteed. </li></ul>

Out of all the plans that could be executed, $A_{90}$ is expected to maximize the agent's performance measure (where the expectation is relative to the agent's knowledge about the environment). The agent's knowledge cannot guarantee anyu of these outcomes for $A_{90}$, but it can provide some degree of belief that they will be achieved. Other plans, such as $A_{180}$, might increase teh agent's belief that it will get to the airport time, but also increase the likelihood of a long wait. The right thing to do-the rational decision-therefore depends on both teh relative importance of various goals and thne likelihood that, and degree to which, they will be achieved. 

<h4> Summarizing Uncertainty </h4>

Trying to use logic to cope with a domain like medical diagnosis fails for three main reasons:

<ul><li> Laziness: It is too much work to list the complete set of antecedents or consequents needed to ensure an exceptionless rule and too hard to use such rules. </li>
<li> Theoretical Ignorance: Medical Science has no complete theory for the domain. </li>
<li> Practical Ignorance: Even if we know all the rules, we might be uncertain about a particular patient because not all the necessary tests have been or can be run. </li></ul>

The agent's knowledge can at best provide only a degree of belief in the relevant sentences. Our main tool for dealing with degrees of belief is probability theory. A probabilistic agent may have a numerical degree of belief between 0  and 1. 

Probability provides a way of summarizing the uncertainty that comes from our laziness and ignorance, thereby solving the qualification problem. We might not know for sure what afflicts a particular patient, but we believe that there is a probability of 0.8-that the patient who has a toothache has a cavity. 

That is, we expect that out of all the situations that are indistinguishable from the current situation as far as our knowledge goes, the patient will have a cavity in 80% of them. This belief could be derived from statistical data-80% of the toothache patients seen so far have had cavities-or from some general dental knowledge, or from a combination of evidence sources. 

<h4> Uncertainty and Rational Decisions </h4>

To make such choices, an agent must first have preferences between the different possible outcomes of the various plans. An outcome is a completely specified state, including such factors as whether the agent arrives on time and the length of the wait at the airport. We use utility theory to represent and reason with preferences. (The term utility is used here in the sense of the quality of being useful, not in the sense of electric company or water works.) Utility theory says that every state has a degree of usefulness, or utility, to an agent and that the agent will prefer states with higher utility. 

The utility of a state is relative to an agent. A utility function can account for any set of preferences-quirky or typical, novel or perverse. Note that utilities can account for altruism, simply by including the welfare of others as one of the factors. 

Preferences, as expressed by utilities, are combined with probabilities in the gneral theory of rational decisions called **decision theory**. The fundamental idea of decision theory is that an agent is rational if and only if it chooses the action that yields the highest expected utility, averaged over all the possible outcomes of the action. This is called the principle of maximum expected utility (MEU). Note that expected might seem like a vague, hypothetical term, but as it is used here it has a precise meaning: it means the average, or statistical mean of the outcomes, weighted by the probability of the outcome. 

Here sketches the structure of an agent that uses decision theory to select actions. The agent is identical, at an abstract level, to the agents that maintain a belief state reflecting the history of percepts to date. The primary difference is that the decision-theoretic agent's belief state represents not just the possibilities for world states but also their probabilities. 

Given the belief state, the agent can make probabilistic predictions of action outcomes and hence select the action with highest expected utility. This section  concentrate on the task of representing and computing with probabilistic information in general. 

<h4> Basic Probability Notation </h4>

For our agent to represent and use probabilistic information, we need a formal language. The language of probability theory has traditionally been informal, written by human mathematicians to other human mathematicians. 

<h5> What probabilties are about </h5>

Like logical assertions, probabilistic assertions are about possible worlds. Whereas logical assertions say which possible worlds are strictly ruled out (all those in which the assertion is false), probabilistic assertions talk about how probable the various worlds are. 

In probability theory, the set of all possible worlds is called the sample space. The possible worlds are mutually exclusive and exhaustive-two possible worlds cannot both be the case, and one possible world must be the case. 

A fully specified probability model associates a numerical probability $P(\omega)$ with each possible world. The basic axioms of probability theory say that every possible world has a probability between 0 and 1 and that the total probability of the set of possible worlds is 1.

$$
0 \geq P(\omega) \geq 1 
$$

for every $\omega$ and $\sum_{\omega in \Omega}P(\omega) = 1$. Probabilistic assertions and queries are not usually about particular possible worlds, but about sets of them. For example, we might be interested in the cases where the two dice add up to 11, the cases where doubles are rolled, and so on. In probability theory, these sets are called events-a term already used extensively for a different concept. In AI, the sets are always described by propositions in a formal language. For each proposition, the corresponding set contains just those possible worlds in which the proposition holds.

The probability associated with a proposition is defined to be the sum of probabilities of the worlds in which it holds: For any proposition $\phi$, P(\phi) = \sum_{\omega \in \phi} P(\omega)$. Note that probability theory does not require complete knowledge of the probabilities of each possible world. Just as with logical assertions, this assertion constrains the underlying probability model without fully determining it. 

Probabilities mentioned above are called unconditional or prior probabilities (and sometimes just priors for short); they refer to degrees of belief in propositions in the absence of any other information. Most of the time, however, we have some information, usually called evidence, that has already been revealed. 

In that case, we are interested not in the unconditional probability of rolling doubles, but the conditional or posterior probability (or just posterior for short). When making decisions, an agent needs to condition on all the evidence it has observed. It is also important to understand the difference between conditioning and logical implication. The extra condition is important; 

Mathematically speaking, conditional probabilities aare defined in terms of unconditional probabilities as follows: for any proposition $a$ and $b$, we have 

$$
P(a \mid b) = \frac{P(a \wedge b)}{P(b)}
$$ 

which holds whenever $P(b)>0$. The definition makes sense if you remember that observing $b$ rules out all those possible worlds where $b$ is false, leaving a set of whose total probability is just $P(b)$. Within that set, the $a$-worlds satisfy $a \wedge b$ and constitute a fraction $P(a \wedge b)/P(b)$. 

The definition of conditional probability, can be written in a different form called the product rule:

$$
P(a \wedge b) = P(a \mid b)P(b)
$$

The product rule is perhaps easier to remember: it comes from the fact that, for $a$ and $b$ to be true, we need $b$ to be true, and we also need $a$ to be true given $b$. 

<h5> The Language of Propositions in Probability Assertions </h5>

In this chapter and the next, propositions describing sets of possible worlds are written in a notation that combines elements of propositional logic and constraint satisfaction notation. It is a factored representation, in which a possible world is represented by a set of variable/value pairs. 

Variables in probability thoery are called random variables and their names begin with an uppercase letter. Every random variable has a domain-the set of possible values it can take on. When no ambiguity is possible, it is common to use a value by itself and to stand for the proposition that a particular variable has that value; 

The preceding examples all have finite domains. Variables can have infinite domains, too-either discrete  (like the integers) or continuous (like the reals). For any variable with an ordered domain, inequalities are also allowed. Finally, we can combine these sorts of elementary propositions by using the connectives of propositional logic. 

$P$ indicates that the result is a vector of numbers, and where we assume a predefined ordering on the domain. We say that the $P$ statement defines a probability distribution for the random variable. The $P$ notation is also used for conditional distributions: $P(X|Y)$ gives the values of $P(X=x_i|Y=y_j)$ for each possible $i,j$ pairs. 

For continuous variables, it is not possible to write out the entire distribution as a vector, because there are infinitely many values. Instead, we can define the probability that a random variable takes on some value $x$ as a parameterized function of  $x$. We call this probability density function. 





<h4> Inference Using Full Joint Distributions </h4>
<h4> Independence </h4>
<h4> Bayes' Rule and Its Use </h4>

<h3> Probabilistic Reasoning </h3>

<h4> Representing Knowledge in an Uncertain Domain </h4>
<h4> The Semantics of Bayesian Networks </h4>
<h4> Efficient Representation of Conditional Distributions </h4>
<h4> Exact Inference in Bayesian Networks </h4>
<h4> Approximate Inference in Bayesian Networks </h4>
<h4> Relational and First-Order Probability Models </h4>

<h3> Probabilistic Reasoning over Time </h3>

<h4> Time and Uncertainty </h4>
<h4> Inference in Temporal Models </h4>
<h4> Hidden Markov Models </h4>
<h4> Kalman Filters </h4>
<h4> Dynamic Bayesian Networks </h4>

<h2> Learning </h2>
<h3> Learning from Examples </h3>
<h4> Forms of Learning </h4>
<h4> Supervised Learning </h4>
<h4> Learning from Decision Trees </h4>
<h4> Evaluating and Choosing the Best Hypothesis </h4>
<h4> The Theory of Learning </h4>
<h4> Regression and Classification with Linear Models </h4>
<h4> Artificial Neural Networks </h4>
<h4> Nonparametric Models </h4>
<h4> Support Vector Machines </h4>
<h4> Ensemble Learning </h4>

<h3> Learning Probabilistic Models </h3>
<h4> Statistical Learning </h4>
<h4> Learning with Complete Data <h4>
<h4> Learning with Hidden Variables: The EM Algorithm </h4>

<h3> Reinforcement Learning </h3>
<h4> Passive Reinforcement Learning </h4>
<h4> Active Reinforcement Learning </h4>
<h4> Generalization in Reinforcement Learning </h4>
<h4> Policy Search </h4>






<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

