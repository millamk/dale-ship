

const refreshStatus = () => {
  let list = document.querySelectorAll('.option')
  list.forEach((dropdown) => {
    dropdown.addEventListener('change',(e) => {
      e.currentTarget.closest('form').submit();
    })
  })
}

export { refreshStatus }
