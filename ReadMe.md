### 논문요약
 - [Regularization and variance selection via the elastic net](https://web.stanford.edu/~hastie/Papers/B67.2%20(2005)%20301-320%20Zou%20&%20Hastie.pdf)
   - [Ridge와 Lasso Regression의 쉬운풀이](https://brunch.co.kr/@itschloe1/11)
   - [Regularized Linear Regression](https://ratsgo.github.io/machine%20learning/2017/05/22/RLR/)
   - L1 regularization : 모델 가중치의 L1 norm(가중치 각 요소 절대값의 합)에 대해 패널티를 부과한다. 대부분의 요소값이 0인 sparse feature에 의존한 모델에서 L1 정규화는 불필요한 피처에 대응하는 가중치들을 정확히 0으로 만들어 해당 피처를 모델이 무시하도록 만든다.  변수선택효과가 있다.
   - L2 regularization : 모델 가중치의 L2 norm의 제곱(가중치 각 요소 제곱의 합)에 대해 패널티를 부과한다. L2 정규화는 outlier 모델 가중치에 대해 0에 가깝지만 0은 아닌 값으로 만든다. L2 정규화는 선형모델의 일반화 능력을 언제나 항상 개선시킨다.
