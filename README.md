# musiXmatch API wrapper in R

[musixmatch](https://www.musixmatch.com/) is a large online catalog of music lyrics, among other song/artist data.  
This project is still very, very much under development.

## Usage

```{r}
library(musixmatch)
set_apikey(YOUR_APIKEY)
```

### Get Artist IDs (**artist.search**)

```{r}
# Return data.frame of most useful fields to identify artist
search_artist('slayer')

# Return list of full XML result in a list
search_artist(artist = 'slayer',simplify=FALSE)
```

### Get album discography of artist (**artist.albums.get**)

```{r}
# Return full list of result for album.  Content simplification not functional yet.
get_album(14250417)
```

### Get all tracks from an album (**album.tracks.get**)

```{r}
# Return data.frame of most useful fields related to tracks on an album
get_track(15445219)
```

### Get Lyrics from a song (**track.lyrics.get**)
```{r}
# Returns lyrics of a song. Content simplification still under development.
get_track_lyrics(15445219)
```


