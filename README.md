
## Sitemap
<pre>
/
/search
/upload
/watch?v=
</pre>


## API
<code>/api/v0.1/</code>
<pre>
upload.js
    ...raw file data...
    -------------------------
    {token}

file.:ext?v=(token)
    Range header supported
    -------------------------
    ...raw file data...
</pre>

## Storage
<pre>
redis   item_metadata   token --> HASH(msgpack(key_num) --> msgpack(value))
redis   format_metadata token --> HASH(msgpack(key_num) --> msgpack(value))
big_jv  file_chunks     [format_token, token, id] --> data
                        Note: format_token is null for the original file
</pre>

## Metadata
<pre>
Item
    title=1:        string
    chunk_sizes=2:  array of sizes

Format

</pre>
