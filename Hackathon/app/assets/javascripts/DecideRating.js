function DecideRating(option, categoryParam) {
    var temp = "";
    var currentImg = '';

    switch(categoryParam) {
        case 'cat1':
            currentImg = '1';
            break;
        case 'cat2':
            currentImg = '2';
            break;
        case 'cat3':
            currentImg = '3';
            break;
        case 'cat4':
            currentImg = '4';
            break;
        case 'cat5':
            currentImg = '5';
            break;
        case 'overall':
            currentImg = '6';
            break;
    }

        if (option == 1) {
            document.getElementById('Rating1' + currentImg).className = "Filled";
            document.getElementById('Rating2' + currentImg).className = "Empty";
            document.getElementById('Rating3' + currentImg).className = "Empty";
            document.getElementById('Rating4' + currentImg).className = "Empty";
            document.getElementById('Rating5' + currentImg).className = "Empty";
            temp = "1";
        }
        if (option == 2) {
            document.getElementById('Rating1' + currentImg).className = "Filled";
            document.getElementById('Rating2' + currentImg).className = "Filled";
            document.getElementById('Rating3' + currentImg).className = "Empty";
            document.getElementById('Rating4' + currentImg).className = "Empty";
            document.getElementById('Rating5' + currentImg).className = "Empty";
            temp = "2";

        }
        if (option == 3) {
            document.getElementById('Rating1' + currentImg).className = "Filled";
            document.getElementById('Rating2' + currentImg).className = "Filled";
            document.getElementById('Rating3' + currentImg).className = "Filled";
            document.getElementById('Rating4' + currentImg).className = "Empty";
            document.getElementById('Rating5' + currentImg).className = "Empty";
            temp = "3";
        }
        if (option == 4) {
            document.getElementById('Rating1' + currentImg).className = "Filled";
            document.getElementById('Rating2' + currentImg).className = "Filled";
            document.getElementById('Rating3' + currentImg).className = "Filled";
            document.getElementById('Rating4' + currentImg).className = "Filled";
            document.getElementById('Rating5' + currentImg).className = "Empty";
            temp = "4";
        }
        if (option == 5) {
            document.getElementById('Rating1' + currentImg).className = "Filled";
            document.getElementById('Rating2' + currentImg).className = "Filled";
            document.getElementById('Rating3' + currentImg).className = "Filled";
            document.getElementById('Rating4' + currentImg).className = "Filled";
            document.getElementById('Rating5' + currentImg).className = "Filled";
            temp = "5";
        }

        $("#" + categoryParam).val(temp);

    return true;
}