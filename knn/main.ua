# read csv data
ReadCSV ← (|2
  # split lines
  ⊜□ ≠@\n.∶

  # split on separators
  ∺(⊐⊜□≠,)∶
)

ParseIris ← (
  # split between numeric and categorical data
  ∩⍉⊃↘↙ 4 ⍉

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
  ⊏⍏[⍥⚂⧻].∶

  # calculate split index
  ⌈×⧻,∶

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
  ≡(↙3⍏)

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
  ⍜∶⊙∶⍉/⊐⊂∵(□⊐⍉)≡(□∺⊂⍜∶⊔[⍥@\s] -1 ⍘⊟) ⍉⊟∶⊙.≡□⬚@ ∵⊔∶+1

  # format upper label
  ≡&p ⍥⊂2∶/⊂[⍥" "]⧻∶⍉./⊐⊂∵(□⊐⍉)≡(□≡/⊐⊂⍉⊟≡(□/⊂[⍥" "])-∵⧻, ⊡ 0 ∶↘1.) ⍉⊂∵□∶
)

# Train test split
r ← 0.8

# Number of Neighbours (Hyperparameter)
k ← 3

# read input file
ReadCSV @, &fras ⊢↘1 &args
ParseIris
TrainTestSplit r
PredictKNN
CalcConfusionMatrix
ShowConfusionMatrix
