# ADBMS
Ng-init  & ng-repeat
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="angular.min.js"></script>
    <script src="script.js"></script>
</head>
<body ng-app="myapp">
    <div ng-controller="myctrl">
        <div ng-repeat = "element in list" ng-init="parent=$index">
            <div ng-repeat = "item in element" ng-init="child=$index">
                {{item}} parent : {{parent}} child : {{child}} 
            </div>
        </div>
        
    </div>
    
</body>
</html>

var app = angular.module('myapp', []);
app.controller('myctrl', function ($scope) {
    var list = [['a','b'],['c','d']]
    $scope.list = list;

 });


Filter exact match
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="angular.min.js"></script>
    <script src="script.js"></script>
</head>
<body ng-app="myapp">
    <div ng-controller="myctrl">
        search: <input ng-model="searchtext.$" type="text" placeholder="search all"/>
        <input type="checkbox" ng-model="exact"> Exact match
        
        <br/>

        <input type="text" ng-model="searchtext.loc" placeholder="search location">

        <input type="text" ng-model="searchtext.city" placeholder="search city">

        <table>
            <thead>
                <th>Name</th>
                <th>location</th>
                <th>city</th>
            </thead>
            <tbody>
                <tr ng-repeat="e in emp | filter : searchtext : exact | orderBy:'-name'
"  >
                    <td>{{e.name | uppercase}}</td>
                    <td>{{e.loc}}</td>
                    <td>{{e.city}}</td>
                    <td>{{e.dateOfBirth | date:"dd/MM/yyyy"}}</td>
                </tr>
            </tbody>
        </table>

        
    </div>
    
</body>
</html>

var app = angular.module('myapp', []);
app.controller('myctrl', function ($scope) {
    var emp = [
        { name: 'amit', loc: 'chembur', city: 'mumbai' , dateOfBirth:new Date("May 3, 2000")},
        { name: 'apeksha', loc: 'kolhapur', city: 'kolhapur',dateOfBirth:new Date("May 3, 2001") },
        { name: 'sahil', loc: 'thane', city: 'thane' ,dateOfBirth:new Date("May 3, 2007")},
        { name: 'rush', loc: 'bandra', city: 'mumbai',dateOfBirth:new Date("May 3, 1996") }
    ];
    $scope.emp = emp;

 });

Sorting by name in asc dec etc
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="angular.min.js"></script>
    <script src="script.js"></script>
</head>
<body ng-app="myapp">
    <div ng-controller="myctrl">
        sort by
        <select ng-model="sortfield">
            <option value="name">name (asc)</option>
            <option value="dateOfBirth">Date of birth (asc)</option>
            <option value="gender">gender (asc)</option>
            <option value="-salary">salry (desc)</option>
        </select>

        <table>
            <thead>
                <th>Name</th>
                <th>DOB</th>
                <th>gender</th>
                <th>Salary</th>
            </thead>
            <tbody>
                <tr ng-repeat="e in emp | orderBy:sortfield"  >
                    <td>{{e.name | uppercase}}</td>
                    <td>{{e.dateOfBirth | date:"dd/MM/yyyy"}}</td>
                    <td>{{e.gender}}</td>
                    <td>{{e.salary}}</td>
                </tr>
            </tbody>
        </table>

        
    </div>
    
</body>
</html>

var app = angular.module('myapp', []);
app.controller('myctrl', function ($scope) {
    var emp = [
        {name:'Ben',dateOfBirth:new Date("November 23, 1980"),gender:"Male",salary:500000,city:"Mumbai"},
        {name:'Sara',dateOfBirth:new Date("May 3, 1970"),gender:"Female",salary:390000,city:"Kurla"},
        {name:'Mark',dateOfBirth:new Date("July 24, 1974"),gender:"Male",salary:200000,city:"Thane"},
        {name:'Pam',dateOfBirth:new Date("June 18, 1979"),gender:"Male",salary:350000,city:"Churchgate"},
        {name:'Todd',dateOfBirth:new Date("April 30, 1983"),gender:"Male",salary:300000,city:"Kopar"}
        ];    
    $scope.emp = emp;

 });


Table head sort arrow 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="angular.min.js"></script>
    <script src="script.js"></script>
</head>
<style>
    .up-arrow{
        
        height:0px;
        width:0px;
        border-left:5px solid transparent;  
        border-right:5px solid transparent;  
        border-bottom:10px solid black;  

        
    }
    .down-arrow{
        height:0px;
        width:0px;
        border-left:5px solid transparent;  
        border-right:5px solid transparent;  
        border-top:10px solid black;  
    }
</style>
<body ng-app="myapp">
    <div ng-controller="myctrl" ng-init="reverse=false">

        <table>
            <thead>
                <th >Name<div id="name" class="up-arrow" ng-click="sortName()"></div></th>
                <th>DOB<div id="dob" class="up-arrow" ng-click="sortDOB()"></div></th>
                <th>gender<div id="gender" class="up-arrow" ng-click="sortGender()"></div></th>
                <th>Salary<div id="salary" class="up-arrow" ng-click="sortSalary()"></div></th>
            </thead>
            <tbody>
                <tr ng-repeat="e in emp | orderBy:sortfield : reverse"  >
                    <td>{{e.name | uppercase}}</td>
                    <td>{{e.dateOfBirth | date:"dd/MM/yyyy"}}</td>
                    <td>{{e.gender}}</td>
                    <td>{{e.salary}}</td>
                </tr>
            </tbody>
        </table>

        
    </div>
    
</body>
</html>

var app = angular.module('myapp', []);
app.controller('myctrl', function ($scope) {
    var emp = [
        {name:'Ben',dateOfBirth:new Date("November 23, 1980"),gender:"Male",salary:500000,city:"Mumbai"},
        {name:'Sara',dateOfBirth:new Date("May 3, 1970"),gender:"Female",salary:390000,city:"Kurla"},
        {name:'Mark',dateOfBirth:new Date("July 24, 1974"),gender:"Male",salary:200000,city:"Thane"},
        {name:'Pam',dateOfBirth:new Date("June 18, 1979"),gender:"Male",salary:350000,city:"Churchgate"},
        {name:'Todd',dateOfBirth:new Date("April 30, 1983"),gender:"Male",salary:300000,city:"Kopar"}
        ];    
    $scope.emp = emp;

    const reversArrow = (field) => {
        $scope.reverse = $scope.reverse ? false : true;
        const arrow = document.getElementById(field);
        if ($scope.reverse === false) {
            arrow.classList.add('up-arrow')
            arrow.classList.remove('down-arrow')
        }
        else {
            arrow.classList.add('down-arrow')
            arrow.classList.remove('up-arrow')
            
        }
    }

     $scope.sortName = () => {
        $scope.sortfield = "name";
         reversArrow('name')  
    }

     $scope.sortDOB = () => {
         $scope.sortfield = "dateOfBirth";
         reversArrow('dob')
         
    }
     $scope.sortGender = () => {
         $scope.sortfield = "gender";
         reversArrow('gender')
    }
     $scope.sortSalary = () => {
         $scope.sortfield = "salary";
         reversArrow('salary')
    }

 });

Single page app

<html>

<head>
    <title>Angular JS Route</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js">
    </script>
</head>

<body>

    <h2>AngularJS Sample Application</h2>

    <div ng-app="mainApp">
        <a href="#addStudent">Add Student</a> <br>

        <a href="#viewStudents">View Students</a>

        <div ng-view></div>

        <script type="text/ng-template" id="addStudent.htm">
            <h2> Add Student </h2> 
            {{message}} 
        </script>
        <script type="text/ng-template" id="viewStudents.htm">
            <h2> View Students </h2> 
            {{message}} 
        </script>
    </div>

    <script>
        var mainApp = angular.module("mainApp", ['ngRoute']);
        mainApp.config(['$routeProvider', function ($routeProvider) {
            $routeProvider
                .when('/addStudent', {
                    templateUrl: 'addStudent.htm',
                    controller: 'AddStudentController'
                })
                .when('/viewStudents', {
                    templateUrl: 'viewStudents.htm',
                    controller: 'ViewStudentsController'
                })
                .otherwise({
                    redirectTo: '/addStudent'
                });
        }]);

        mainApp.controller('AddStudentController', function ($scope) {
            $scope.message = "This page will be used to display add student form";
        });
        mainApp.controller('ViewStudentsController', function ($scope) {
            $scope.message = "This page will be used to display all the students";
        }); 
    </script>
</body>

</html>

Form validation 
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="angular.min.js"></script>
    <script src="script.js"></script>
</head>

<body ng-app="myapp">
    <div ng-controller="myctrl" ng-init="reverse=false">
        <h1>angular from</h1>

        <form name="form1">
            firstname:<input type="text" ng-model="fname" name="fname" required />
            <p ng-show="form1.fname.$invalid" style="color:red">This field is reuired</p><br>

            lastname:<input type="text" ng-model="lname" /><br>
            gender:
            <input type="radio" name="gender" ng-model="gender" />male

            <input name="gender" type="radio" ng-model="gender" checked /> female

            <!-- <span ng-show="form1.gender.$invalid" style="color: red">*Gender is required</span><br> -->

            Email:<input type="email" ng-model="email" name="email" required />
            <p ng-show="form1.email.$invalid" style="color:red">This field is reuired</p><br>

            <input type="submit" value="submit">
        </form>

        <p>{{form1.$submitted}}</p>

    </div>

</body>

</html>



Validatop custom 
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="angular.min.js"></script>
    <script src="script.js"></script>
</head>

<body ng-app="myapp">
    <div ng-controller="myctrl" ng-init="reverse=false">
        <h1>angular from</h1>

        <form name="form1">
            Full name:<input type="text" ng-model="fname" name="fname" required />
            <p ng-show="form1.fname.$invalid" style="color:red">This field is reuired</p><br>
            DOB:<input type="date" ng-model="dob" max="2022-12-08" required /><br>
            gender:
            <input type="radio" name="gender" ng-model="gender" />male
            <input name="gender" type="radio" ng-model="gender" checked /> female<BR>


            Email:<input type="email" ng-model="email" name="email" required />
            <p ng-show="form1.email.$invalid" style="color:red">This field is reuired</p><br>

            <p>Mobile : <input type="number" name="mobile" ng-model="mobile"
                    onkeypress="if(this.value.length==10) return false;" required></br>
                <span ng-show="form1.mobile.$invalid" style="color: red">*Field does not contain valid mobile
                    number</span></br>


                <input type="submit" value="submit">
        </form>

        <p>{{form1.$submitted}}</p>

    </div>

</body>

</html>


Jsx
import './App.css';

function App() {

  let greeting =''
  const date = new Date();
  var hour = date.getHours();
  if (hour < 12)
    greeting = 'morning'
  
  if (hour>12 && hour < 16) {
    greeting = 'afternoon'
  }
  if (hour>16 && hour < 23) {
    greeting = 'night'
  }
    

  return (
    <div className="App">
      <h1>Good {greeting}</h1>
    </div>
  );
}

export default App;


parent child & functional & styling
import React from "react";

function PrintDetails(props) {
    return <div className="details">
        <h2>name:{props.name}</h2>
        <p>age:{props.age}</p>
        <p>location:{props.location}</p>
    </div>;
}

export default PrintDetails;

app.css
.details{
  background-color: aquamarine;
  width: 15%;
  height: 10%;
  padding: 20px;
  border-radius: 10px;
  margin:10px;
  border:rgb(1, 69, 71) 4px solid;
}

.details h2{
  color :rgb(58, 2, 128);
}

.details p{
  color:palevioletred;
  font-weight: bolder;
  font-size: 20px;
  
}


Mapping component
import React from 'react';

function Navbar(){
return <div className='nav-bar'>
<ul>
<li>Home</li>
<li>Contact</li>
</ul>
</div>;
}

export  default Navbar;


import React from 'react';
import Navbar from './navbar';

function Header (){
return <div>
<h1>Main header</h1>
<Navbar />
</div>;
}

export  default Header;


