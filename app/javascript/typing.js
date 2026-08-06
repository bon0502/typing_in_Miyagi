document.addEventListener('turbo:lond', () => {
  const backButton = document.getElementById('back-button');

  if (backButton) {
    backButton.addEventListener('click', () =>{
      window.location.href = '/selections';
    });
  }
});
