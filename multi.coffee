n1 = document.getElementById 'number1'

n2 = document.getElementById 'number2'

ans = document.getElementById 'answer'

stat = document.getElementById 'stat'

correctAns = document.getElementById 'correct-answers'

wrongAns = document.getElementById 'wrong-answers'

timeLeft = document.getElementById 'time-left'

timeRemaining = 5
cAns = 0
wAns = 0
timer = null

updateNums = () ->
  n1.textContent = Math.floor Math.random() * 12
  n2.textContent = Math.floor Math.random() * 12
  answer.value = ''

correct = () ->
		stat.textContent = "Good job!"
		setTimeout () ->
			stat.textContent = "Answer the question."
		, 1000
		timeRemaining = 5
		resetTimer()
		startTimer()
		cAns++
		correctAns.textContent = cAns
		updateNums()

wrong = () ->
		stat.textContent = "Try again."
		setTimeout () ->
			stat.textContent = "Answer the question."
		, 1000
		timeRemaining = 5
		resetTimer()
		startTimer()
		wAns++
		wrongAns.textContent = wAns
		updateNums()

check = () ->
	if Number n1.textContent * Number n2.textContent == Number answer.value
		correct()
	else
		wrong()

resetTimer = () ->
		clearInterval(timer)

startTimer = () ->
  timer = setInterval () ->
    timeRemaining--
    timeLeft.textContent = timeRemaining
    if timeRemaining <= 0
      check()
  , 1000

startTimer()

answer.addEventListener 'keydown', (event) ->
	if event.key == 'Enter'
		check()
