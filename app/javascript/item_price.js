const price = () => {
    const priceInput = document.getElementById("item-price");
    if (!priceInput) return;

    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = calculateTax(inputValue)
      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = calculateProfit(inputValue, calculateTax(inputValue))
  })

  function calculateTax(price) {
    const tax = Math.floor(price * 0.1);
    return tax;
  }

  function calculateProfit(price, tax) {
    const profit = price - tax;
    return profit;
  }

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
