## Lpheada- Labelled Public HEAlth DAtaset

<img src="/Images/lpheada.jpg" width="370">
 
This repository contains three six labelled datasets on digital public health surveillance. 



## How to Access Data

To retrive a complete tweet object including text, data, user information, and location you will need to apply for a [developer account](https://developer.twitter.com/en/solutions/academic-research) to access Twitter APIs.


<img src="/Images/twarc.jpg" width="700">

After creating the account, install `twarc`, an API to hydrate tweetr data from TweetIDs. 

`pip install twarc`

To configure your twart requests, run the following scripy and enter the four credentials explained earlier.

`twarc config`

Now you are ready to pass the files in the IDs folder to Twitter API and collect all the metadata associated with each ID.





 


## Geospatial Data
To extract the location data, we use the {place} and {full place} fields of the Twitter dataset. For each country, we need a metadata of the geographical locations to map these fields to actual city/province/state names.

<img src="/Images/LocationProcess.jpg" width="450">

## Citation

The manuscript that presents this dataset is under review at Scientific Data Nature. Please cite our paper if you use this dataset in your project.

``` 
Zahra Shakeri Hossein Abad, Wendy Thompson, Gregory P Butler, Joon Lee. 
Physical activity, sedentary behaviour, and sleep quality on Twitter:
A multicountry and fully labelled dataset for public health surveillance research.
Scientific Data Nature [Under Review], April 2021.
```

