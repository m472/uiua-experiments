# Length of feature vectors
N ← 4

# Train test split
r ← 0.8

# Number of Neighbours (Hyperparameter)
k ← 3

# read csv data
Sep ← @,
ReadCSV ← (|1.2
  # split lines
  ⊜□ ≠@\n.

  # split on separators
  ≡⊐⊜□≠Sep.

  # split between input and output
  ∩⍉⊃↘↙ N ⍉

  # encode labels
  ⍜∶'/⊂⊝⊛.

  # switch labels and input on stack
  ∶⊙∶

  # parse inputs
  ∵parse

  # combine input and encoded labels
  ⍜⍉⊂
)

# Shuffle and Train/Test Split, after this Xy test Xy train is on top of stack
TrainTestSplit ← (
  # shuffle
  ⊏⍏[⍥⚂⧻].

  # calculate split index
  ⌈×r⧻.

  # actual split
  ⊃↘↙
)

# predict
PredictKNN ← (|2
  # create table of distance vectors for all combinations of train input and test input
  ⊠-∩(⍜⍉(↙-1⧻.)),,

  # calculate euclidean distances
  √≑1/+⍘√

  # search closest k neighbours in train set
  ≡(↙k⍏)

  # lookup train label
  ⊏⊙(∶∩(⊢⇌⍉))

  # calculate mode of neighbour labels
  ≡(⊡⊗0⍖/+⊞=..)

  # combine prediction and test label
  ⊟
)

# calculate confusion matrix
CalcConfusionMatrix ← (|1
  # count number of unique elements
  ⧻⊝♭.⍉

  # construct all combinations of prediction and ground truth
  /⊂⊞⊂.⇡,∶

  # count all combination
  ≡/⊂≐⌕

  # tally up and reshape into square
  ↯⊂.∶/+⍉
)

# show confusion matrix
ShowConfusionMatrix ← (|2.0
  # convert numbers to string
  ⊙∶/↥∵⧻.∶⊂{""}∶⍜⍉⊂,∵'□$" _"

  # format lower label
  ⍜∶⊙∶⍉/⊐⊂∵(□⊐⍉)≡(□∺⊂⍜∶⊔[⍥@ ]-1⊡0∶⊡1.) ⍉⊟∶⊙.≡□⬚@ ∵⊔∶+1

  # format upper label
  ≡&p ⍥⊂2∶/⊂[⍥" "]⧻∶⍉./⊐⊂∵(□⊐⍉)≡(□≡/⊐⊂⍉⊟≡(□/⊂[⍥" "])-∵⧻, ⊡ 0 ∶↘1.) ⍉⊂∵□∶
)

# read input file
ReadCSV &fras ⊢↘1 &args
TrainTestSplit
PredictKNN
CalcConfusionMatrix
ShowConfusionMatrix
