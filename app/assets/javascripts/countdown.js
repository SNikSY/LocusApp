// Установим дату отсчета
const targetDate = new Date().getTime() + 180 * 24 * 60 * 60 * 1000 // 5 дней от текущего времени

function updateCountdown() {
  const now = new Date().getTime()
  const distance = targetDate - now

  if (distance > 0) {
    const days = Math.floor(distance / (1000 * 60 * 60 * 24))
    const hours = Math.floor(
      (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
    )
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
    const seconds = Math.floor((distance % (1000 * 60)) / 1000)

    document.getElementById('days').textContent = days
    document.getElementById('hours').textContent = hours
    document.getElementById('minutes').textContent = minutes
    document.getElementById('seconds').textContent = seconds
  } else {
    // Таймер завершился
    document.querySelector('.countdown').textContent = 'Сайт уже доступен!'
  }
}

setInterval(updateCountdown, 1000)
