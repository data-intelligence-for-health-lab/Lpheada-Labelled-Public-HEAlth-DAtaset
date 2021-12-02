## Lpheada- Labelled Public HEAlth DAtaset
[![DOI](https://zenodo.org/badge/354686567.svg)](https://zenodo.org/badge/latestdoi/354686567)


<img src="/Images/lpheada.jpg" width="370">
 
This repository contains three six labelled datasets on digital public health surveillance. 



## How to Access the Data

To retrive a complete tweet object including text, data, user information, and location you will need to apply for a [developer account](https://developer.twitter.com/en/solutions/academic-research) to access Twitter APIs.


<img src="/Images/twarc.jpg" width="700">

After creating the account, install `twarc`, an API to hydrate tweetr data from TweetIDs. 

`pip install twarc`

To configure your twart requests, run the following script and enter the four credentials explained earlier.

`twarc configure`

Now you are ready to pass the files in the IDs folder to Twitter API and collect all the metadata associated with each ID.

### Rehydrate the Dataset using TweetIDs or UersIDs

To rehydrate the dataset, you can use Twarc’s hydrate command can be used to rehydrate the full dataset using unique tweet identifiers. The output will be saves as a json file. Please use the Tweet_IDs folder for this purpose.  

`twarc hydrate PhysicalActivity-TweetIDs-Canada.txt > Canada_PA.jsonl`

 To only retrieve user's information (metadata), use Twarc's **user** command:
 
 `twarc users UserIDs.txt > user_meta.jsonl`
 
 #### Example

------------------------------------------------------------------


## Geospatial Data Inference
To extract the location data, we use the {place} and {full place} fields of the Twitter dataset. For each country, we need a metadata of the geographical locations to map these fields to actual city/province/state names.

<img src="/Images/LocationProcessU.jpg" width="650">

To infer the location data associated with each tweet, in addition to the `place` and `full.place` fields, we use user's profile information as well as the tweet text. The example provided in the above figure illustrated the overal process of this task. Please refer to `LocationInference.ipynb` for the script. 

## Citation

The manuscript that presents this dataset has been accepted for publication at JMIR Public Health and Surveillance. Please cite our paper if you use this dataset in your project.

``` 
@article{PASSDS,
	author = {Shakeri Hossein Abad, Zahra and Thompson, Wendy and Butler, Gregory and Lee, Joon},
	title = {Physical activity, sedentary behaviour, and sleep on Twitter: A multicountry and fully labelled dataset for public health surveillance research},
	year = {forthcoming},
	doi = {10.2196/32355},
	journal = {JMIR Public Health and Surveillance}
}
```

## More Questions

Please use issues on this Github for any questions or feedback. You can also contact us at dih[at]ucalgary.ca or joonwu.lee[at]ucalgary.ca for specific inquiries.  
