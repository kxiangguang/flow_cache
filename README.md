Caching Network Flows
======================
A flow is defined as a sequence of packets that have the same 'fate'. In networking it is common to have many million of flows flowing through a pipe. Each of the flow has a different traffic pattern. 

To improve performance of the system, it is important to use flow caching. However the number of flows is many time larger than the cache size. Also there is no spatial locality between the flows. The only thing that the cache replacement algorithm can rely on is the temporal locality. If the packets of the flow arrive bunched together in a small window of time then the cache can be effective.

Traffic Assumptions
======================
We assume that though there are a large number of flows active, there is a small subset of flows that are using more than their proportional share of bandwidth. We arbitarily decide that if there is a long lived flow is using say >= 1% of the total bandwidth then it is a "fat flow". For example given a pipe of 500Gb, any long lived flow that is using >= 5Gb is a fat flow. Note that we are assuming that the flow is long lived and not a transient flow.

Note that in our view of the world,a flow is not a single TCP connection. In fact we assume that a flow is an aggreation of many lower level flows. Hence we do not try to model the traffic characterisitics of a single TCP flow. Instead we create different scenarios and study the behavior of various common cache replacement algorithm like LRU, Random.

Modeling Flows
==================
A flow is modelled under different profile. They are
1. TDM arrival: Given a rate, the packets of the flow are arriving at a fixed rate.
2. Non self similar traffic models.
   Here we assume that aggregating traffic from a large number of sources would smooth out the burstiness. 
   1. Poisson: Ignore burstiness completely.Mean Arrival rate (Lambda). Thus packet inter arrival time have an exponential distribution with mean = 1/lambda. Poisson is memoryless ie the probability of an event happening does not depend on the previous history.
   2. Compound Poisson : Inter-batch arrival times are exponentially distributed while the batch size is geometric. Lambda is the arrival rate and rho is the batch parameter.
   3. Markov modulated poisson traffic model. A continuous time markov chain determines the arrival rate in a poisson model. The markov chain is a 2 state chain each with an associated rate lambda and each state has a distinct mean sojourn time r.
3. Self Similar Flows.

