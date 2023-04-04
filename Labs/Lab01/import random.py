import random

# Ask user for input
count = int(input("How many random numbers do you want? "))

# Generate and print out the random numbers
for i in range(count):
    print(random.randint(1, 100))
