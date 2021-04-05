import numpy as np
import pandas as pd 
import textstat


df= pd.read_csv("../path/TwitterDataset.csv")

#Cleanign the text --> Removing html tags
df['text'] = df['text'].str.replace('http\S+|www.\S+', '', case=False)

df['Flesch_Reading_Ease_formula'] =df['text'].apply(lambda x:textstat.flesch_reading_ease(x))
df['gunning_fog'] = df['text'].apply(lambda x: textstat.gunning_fog(x))
df['smog_index'] = df['text'].apply(lambda x: textstat.smog_index(x))
df['automated_readability_index'] = df['text'].apply(lambda x: textstat.automated_readability_index(x))
df['coleman_liau_index'] = df['text'].apply(lambda x: textstat.coleman_liau_index(x))
df['linsear_write_formula'] = df['text'].apply(lambda x: textstat.linsear_write_formula(x))
df['dale_chall_readability_score'] = df['text'].apply(lambda x: textstat.dale_chall_readability_score(x))
df['text_standard'] = df['text'].apply(lambda x: textstat.text_standard(x))
df['text_standard_float'] = df['text'].apply(lambda x: textstat.text_standard(x,float_output  = True))
# df['lexicon_count'] = df.apply(lambda row: textstat.lexicon_count(df['text'], removepunct=True), axis=1)
df['lexicon_count'] = df['text'].apply(lambda x: textstat.lexicon_count(x))
# df.apply(lambda row:  textstat.lexicon_count(row['text'], row['p'], ck, ch), axis=1)
df['sentence_count'] = df['text'].apply(lambda x: textstat.sentence_count(x))

#-------------------------------------------------------------------------------------

#To calculate the grammar score
import language_tool_python
tool = language_tool_python.LanguageTool('en-US')
df['grammar_score'] = df['text'].apply(lambda x: len(tool.check(x)))
