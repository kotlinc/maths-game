n1 = document.getElementById 'number1'

n2 = document.getElementById 'number2'

ans = document.getElementById 'answer'

stat = document.getElementById 'stat'

one = document.getElementById '1'
two = document.getElementById '2'
three = document.getElementById '3'
four = document.getElementById '4'
five = document.getElementById '5'
six = document.getElementById '6'
seven = document.getElementById '7'
eight = document.getElementById '8'
nine = document.getElementById '9'
zero = document.getElementById '0'
ch = document.getElementById 'check'
del = document.getElementById 'del'

correctAns = document.getElementById 'correct-answers'

wrongAns = document.getElementById 'wrong-answers'

timeLeft = document.getElementById 'time-left'

timeRemaining = 7
cAns = 0
wAns = 0
timer = null

updateNums = () ->
  n1?.textContent = Math.floor Math.random() * 12
  n2?.textContent = Math.floor Math.random() * 12
  answer?.value = ''

correct = () ->
		stat?.textContent = "Good job!"
		setTimeout () ->
			stat?.textContent = "Answer the question."
		, 1000
		timeRemaining = 7
		resetTimer()
		startTimer()
		cAns++
		correctAns?.textContent = cAns
		updateNums()

wrong = () ->
		stat?.textContent = "Try again."
		setTimeout () ->
			stat?.textContent = "Answer the question."
		, 1000
		timeRemaining = 7
		resetTimer()
		startTimer()
		wAns++
		wrongAns?.textContent = wAns
		answer?.value = ''

check = () ->
	if (Number n1?.textContent * n2?.textContent) == Number answer?.value
		correct()
	else
		wrong()

resetTimer = () ->
		clearInterval(timer)

startTimer = () ->
  timer = setInterval () ->
    timeRemaining--
    timeLeft?.textContent = timeRemaining
    if timeRemaining <= 0
      check()
  , 1000

startTimer()

answer?.addEventListener 'keydown', (event) ->
	if event.key == 'Enter'
		check()

one?.addEventListener 'click', () ->
	answer?.value += 1

two?.addEventListener 'click', () ->
	answer?.value += 2

three?.addEventListener 'click', () ->
	answer?.value += 3

four?.addEventListener 'click', () ->
	answer?.value += 4

five?.addEventListener 'click', () ->
	answer?.value += 5

six?.addEventListener 'click', () ->
	answer?.value += 6

seven?.addEventListener 'click', () ->
	answer?.value += 7

eight?.addEventListener 'click', () ->
	answer?.value += 8

nine?.addEventListener 'click', () ->
	answer?.value += 9

zero?.addEventListener 'click', () ->
	answer?.value += 0

ch?.addEventListener 'click', () ->
	check()

del?.addEventListener 'click', () ->
	answer?.value = answer?.value.slice 0, -1