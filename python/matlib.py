import numpy as np
incomes = np.random.normal(27000, 15000, 10000)
#print(len(incomes))
incomes = np.append(incomes, [1000000000])
import matplotlib.pyplot as plt
plt.hist(incomes, 50)
plt.show()
print(incomes.mean())
