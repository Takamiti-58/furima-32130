window.addEventListener('load', function() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', function() {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1 )
    const addTaxProfit = document.getElementById("profit");
    addTaxProfit.innerHTML = Math.floor(inputValue * 0.9 )
  })
});
