let updateUI = () => {
    // console.log("updateUI = () = 입니다.");

}


function productMethod(cartId, originalPrice, productId, total, current_quantity) {
    console.log(cartId+" "+originalPrice + " "+productId);

    let newQuantity = $("#productSelect" + cartId + " option:selected").val();
    console.log(newQuantity);

    let data = {
       "cartId" : cartId,
       "originalPrice" : originalPrice,
        "productId" : productId,
        "newQuantity" : newQuantity
    };

    // $.ajax({
    //     url:"/product/updatePrice",
    //     method: "get",
    //     data: data,
    //     success: (message) => {
    //
    //     }
    // });

    // document.getElementById("tmp_tbody").getElementsByTagName("tr")[3].getElementsByTagName("td")[4].innerHTML = 'T E S T'
    document.getElementById("td_price"+productId).innerHTML = originalPrice * newQuantity;
    document.getElementById("total1").innerHTML = total-(current_quantity*originalPrice)+originalPrice * newQuantity;
    document.getElementById("total2").innerHTML = total-(current_quantity*originalPrice)+originalPrice * newQuantity;
    // document.getElementById("total2").innerHTML =
    // let selected = $("#selected" + cartId)
    // let selected = $("#selected")
    // console.log(selected.val())

    // console.log(productSelect.val()

}


function deleteProduct(id, price, total){
    console.log("DeleteProdcut method" + id);
    console.log(price + " 무야호 " + total)
    document.getElementById("total1").innerHTML = (total - price);
    document.getElementById("total2").innerHTML = (total - price);
    let data = { "productId" : id };

    $.ajax({
        url:"/product/deleteCart",
        method: "get",
        data : data,
        success: (message) => {
            let result = JSON.parse(message);


            // location.reload();
        }
    });

}













