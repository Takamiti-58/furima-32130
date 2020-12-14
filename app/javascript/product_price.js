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

// ①priceInputで、入力がされたら、以下の処理を行う　※記事参照
// ②priceInputに入力された「値」を取得する　※記事参照

// ③手数料・販売履歴を貼り付ける場所を取得する（getElementById）

// ④②で取得した値を計算する（手数料１０％、利益＝値ー手数料）

// ⑤③で取得した住所に④で計算した値を貼り付ける