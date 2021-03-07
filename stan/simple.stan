/* Simple linear regression */
data {
  int<lower=1> N; 
  vector[N] x;
  vector[N] y;
  int<lower=1> M; 
  vector[M] new_x;
}

parameters {
  real alpha;   
  real beta;   
  real<lower=0> sigma;  
}

model {
  // Priors
  alpha ~ normal(178, 100);
   beta ~ normal(0, 10);
  sigma ~ uniform(0, 50);
  
  // Likelihood
  for (n in 1:N){
    target += normal_lpdf(y[n] | alpha + beta * x[n], sigma);
  }
  
}

generated quantities {
  vector[M] new_y;
  
  for (i in 1:M)
  new_y[i] = normal_rng(alpha + beta * new_x[i], sigma); //应该加入sigma
  
}


