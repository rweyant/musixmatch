
#' get lyrics from a song
#'
#' @param track_id musiXmatch ID of song
#' @return a data.frame or list containing the data from the API call
get_track_lyrics <- function(track_id,simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'), track_id=track_id, format='xml')
  # Load optional arguments from dots
  dots <- list(...)
  body <- append(body,dots[names(dots) %in% c('track_mbid')])

  request <- api_call('track.lyrics.get',body)

  check_status_code(status_code(request))

  if( simplify && FALSE)  result <- simplify_get_lyrics(content(request))
  else result <- get_full_list(content(request))

  result
}

#' Search for information about a track based on its artist, name, or lyrics
#' @param q_track track name
#' @param q_artist artist name
#' @param q_lyrics song lyrics
search_track <- function(page_size=100,simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'),
               page_size=page_size,
               format='xml')
  # Load optional arguments from dots
  dots <- list(...)
  body <- append(body,dots[names(dots) %in% c('q_track','q_artist','q_lyrics',
                                              'page','f_has_lyrics','f_artist_id',
                                              'f_music_genre_id','f_artist_mbid',
                                              'f_lyrics_language','s_track_rating',
                                              's_artist_rating','quorum_factor')])


  request <- api_call('track.search',body)

  check_status_code(status_code(request))

  if( simplify && FALSE )  result <- simplify_search_track(content(request))
  else result <- get_full_list(content(request))

  result
}

#' Get information about a track
#' @param track_id the musixmatch track ID
get_track <- function(track_id,simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'),track_id=track_id,format='xml')
  # Load optional arguments from dots
  dots <- list(...)
  body <- append(body,dots[names(dots) %in% c('track_mbid')])


  request <- api_call('track.get',body)

  check_status_code(status_code(request))

  if( simplify && FALSE )  result <- simplify_get_track(content(request))
  else result <- get_full_list(content(request))

  result
}

#' Get subtitle of a track in LRC or DFXP format
#' @param track_id musixmatch track ID
get_track_subtitle <- function(track_id,subtitle_format='lrc',simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'),track_id=track_id,subtitle_format=subtitle_format,format='xml')
  # Load optional arguments from dots
  dots <- list(...)
  body <- append(body,dots[names(dots) %in% c('track_mbid','subtitle_format','f_subtitle_length','f_subtitle_length_max_deviation')])

  request <- api_call('track.subtitle.get',body)

  check_status_code(status_code(request))

  if( simplify && FALSE )  result <- simplify_get_track_subtitle(content(request))
  else result <- get_full_list(content(request))

  result
}

#' Get a lyrics snipped for a track.  A lyrics snippet is a very short representation of a song lyrics.
#' It’s usually twenty to a hundred characters long and it’s calculated extracting a sequence of words from the lyrics.
#' @param track_id the musixmatch track ID
get_track_snippet <- function(track_id,simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'),track_id=track_id,format='xml')

  request <- api_call('track.snippet.get',body)

  check_status_code(status_code(request))

  if( simplify && FALSE )  result <- simplify_get_track_snippet(content(request))
  else result <- get_full_list(content(request))

  result
}

#' Submit a lyrics to Musixmatch database.
#' @param track_id the musixmatch track ID
#' @param lyrics_body the lyrics
post_track_lyrics <- function(track_id,lyrics_body,simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'),track_id=track_id,lyrics_body=lyrics_body,format='xml')

  request <- api_call('track.lyrics.post',body)

  check_status_code(status_code(request))

  if( simplify && FALSE )  result <- simplify_post_track_lyrics(content(request))
  else result <- get_full_list(content(request))

  result
}

#' Post feedback to a lyrics submission on musixmatch
#' @param lyrics_id musixmatch lyrics id
#' @param track_id the musixmatch track_id
#' @param feedback the feedback to be reported
post_track_lyrics_feedback <- function(track_id,lyrics_id,feedback,simplify=TRUE,...){

  body <- list(apikey=getOption('mmapikey'),track_id=track_id,lyrics_id=lyrics_id,feedback,format='xml')

  request <- api_call('track.lyrics.feedback.post',body)

  check_status_code(status_code(request))

  if( simplify && FALSE )  result <- simplify_post_track_lyrics_feedback(content(request))
  else result <- get_full_list(content(request))

  result
}
