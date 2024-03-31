//SPDX-License-Identifier: MIT

//an time-based automation example
//to understand how chainlink automation works 

//well i wasnt able to make automation wrok for every seconds so this can be cahnged

pragma solidity ^0.8.18;

contract toyotaSupra{

    int256 speed;
    uint256 maxSpeed = 249;
    uint256 maxReverseSpeed = 60;
    int256 accelaration = 20;
    uint256 gear;

    constructor(){
        speed = 0;
        gear = 0;
    }

    function carVelocity() external{
        if(gear == 0){
            if(speed > 0){
                speed += (speed - 40);
                if(speed < 0) speed = 0;
            }
        }
        else if(gear == 0 && speed < 90){
            speed += (speed + accelaration* 9/10);
            if (speed > 90) speed = 90;
        }
        else if(gear == 2 && speed < 170){
            speed += (speed + accelaration* 8/10);
            if (speed > 170) speed = 170;
        }
        else if(gear == 3 && speed < 220){
            speed += (speed + accelaration* 4/10);
            if (speed > 220) speed = 220;
        }
        else if(gear == 4 && speed < 240){
            speed += (speed + accelaration* 2/10);
            if (speed > 240) speed = 240;
        }
        else if(gear == 5 && speed < 249){
            speed += (speed + accelaration* 2/10);
            if (speed > 249) speed = 249;
        }
    }

    function gearUp() external{
        if(gear < 5){
            gear += 1;
        }
    }

    function gearDown() external{
        if(gear > 0){
            gear -= 1;
        }
    }
}