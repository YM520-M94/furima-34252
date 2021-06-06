function calc (){
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){

    const inputValue = priceInput.value
    const Tax = 0.1;
    const tax_fee = inputValue * Tax;
    const profit = inputValue - tax_fee;
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = tax_fee;
    profitArea.innerHTML = profit;

  })
}

window.addEventListener('load', calc)