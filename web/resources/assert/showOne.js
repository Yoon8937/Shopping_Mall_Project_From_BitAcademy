let showOneMethod = () => {
    console.log("showOneMethod 입니다.ㅇ")



    checkisExist();
}




function checkIsExist(id){
    console.log("this is checkis Exist method")

    let data = {"id": id};

    $.ajax({
        url: "/product/checkIsExㅎist",
        method: "get",
        data: data,
        success: (message) => {
            let result = JSON.parse(message);
            if(result.isExistBool == "true"){
                alert("해당 제품이 이미 장바구니에 있습니다.");
                location.href("/product/cart");
            }


        }


        });
}
