<!DOCTYPE html>
<html>
   <head>
      <title>User</title>
   </head>
   <body>
   <form action="createAuctionManager.jsp" method="POST">
   
    <h1>Create Auction</h1>
   <div>
   	<h2>Item Details...</h2>
   	Listing Name: <input type="text" name="listingname"/> <br/>
   	</div>
   	
   	<div>
   	<h3>Device Type:</h3>
  	<select name="itemtype" id="Device Type"> 
  	  	<option value="" selected disabled hidden=null>Choose here</option>
       	<option value="laptop">Laptop</option>
       	<option value="desktop">Desktop</option>
       	<option value="tablet">Tablet</option>
   	</select>
   	</div> 	
   	
   	<div>
   	<h3>Color:</h3>
   	<select name="color" id="Color"> 
   	   <option value="" selected disabled hidden=null>Choose here</option>
       	<option value="black">Black</option>
       	<option value="white">White</option>
        <option value="gray">Black</option>
       	<option value="silver">Silver</option>
       	<option value="red">Red</option>
       	<option value="blue">Blue</option>
       	<option value="green">Green</option>
       	<option value="gold">Gold</option>
       	<option value="other">Other</option>
    </select>
    </div>
   	
   	<div>
 	<h3>Brand:</h3>
   	<select name="brand" id="Brand"> 
  	  	<option value="" selected disabled hidden=null>Choose here</option>
       	<option value="Apple">Apple</option>
       	<option value="Microsoft">Microsoft</option>
        <option value="Samsung">Samsung</option>
       	<option value="Dell">Dell</option>
       	<option value="HP">HP</option>
       	<option value="Huawei">Huawei</option>
       	<option value="Amazon">Amazon</option>
       	<option value="Google">Google</option>
       	<option value="other">Other</option>
    </select>
    </div>
    
 	<h3>Model Year:</h3>    
    <div>
    <select name="modelYear" id="Model Year"> 
  	  	<option value="" selected disabled hidden=null>Choose here</option>
       	<option value="2022">2022</option>
       	<option value="2021">2021</option>
        <option value="2020">2020</option>
       	<option value="2019">2019</option>
       	<option value="2018">2018</option>
       	<option value="2017">2017</option>
       	<option value="2016">2016</option>
       	<option value="2015">2015</option>
       	<option value="2014">2014</option>
        <option value="2013">2013</option>
        <option value="2012">2012</option>
        <option value="2011">2011</option>
        <option value="2010">2010</option>
        <option value="OlderThan2010">Older Than 2010</option>   	
    </select>
   	</div>
   	
   	<h2>Auction Details...</h2> 
   	
   	<div>
   	<h3>End Date:</h3> 
   	<input type="date" name="endDateTime" 
           placeholder="dd-mm-yyyy" value="endDateTime"
           min="1997-01-01" max="2030-12-31">
   	</div>
	
	<div>
	<h3>Initial Price:</h3>
	$<input type="number" min="0" name="initialPrice"/> <br/>
	</div>
	
	<div>
	<h3>Reserve Price:</h3>
	$<input type="number" min="0" name="reservePrice"/> <br/>
	</div>
	
	<div>
	<h3>Minimum Bid Increment:</h3>
	$<input type="number" min="0" name="minIncrement"/> <br/>
	</div>
	
   	<div>
    <input type="submit" value="Submit"/>
    </div>
    
    </form>
     
   </body>
</html>