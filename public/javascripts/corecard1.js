import { createMenu } from "./makemenu.js";

const initialize = function () {
    createMenu('menu');
}


let i = 0;


function slideshow () {
    let slider = document.getElementById("slider");
    let slides = Array.from(document.getElementsByClassName("slide"));
    slides.forEach(slide => {
        return slide.style.display = "none";
    })

    i++;
    if (i > slides.length){
        i = 1;
    }

    slides[i-1].style.display = "block";
    
    setTimeout(slideshow, 6000);

}

slideshow();

let j = 0;

function colorDot () {

    let dots = Array.from(document.getElementsByClassName("dot"));
    dots.forEach(dot => {
        return dot.style.opacity = "0.3";
    })
    j++;
    if (j > dots.length){
        j = 1;
    }
    dots[j - 1].style.opacity = "0.8";
    
    setTimeout(colorDot, 6000);
    }
    
colorDot();


// window.addEventListener('load', slideshow);
window.addEventListener('load', initialize);
