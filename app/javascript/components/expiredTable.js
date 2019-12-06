const expiredTable = () => {
  const detailsBtn = document.getElementById('toggle-detail');
  const icon = document.getElementById('toggle-icon');
  detailsBtn.addEventListener('click', (event) => {
    const tableDisplay = document.getElementById('expired-table');
    icon.classList.toggle('fa-sort-down')
    icon.classList.toggle('fa-sort-up')
    tableDisplay.classList.toggle('table-display-none');
    icon.classList.toggle('pb-2');
    icon.classList.toggle('pt-2');
  });
}

export default expiredTable;
