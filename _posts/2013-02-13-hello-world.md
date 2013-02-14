---
layout: post
title: "Hello World"
description: ""
category: 
tags: []
---
{% include JB/setup %}

This is a regular paragraph.

<table>
    <tr>
        <td>Foo</td>
    </tr>
</table>

This is another regular paragraph.

This is an H1
=============

This is an H2
-------------

`aaaaa

# This is an H1

## This is an H2

###### This is an H6

# This is an H1 #

## This is an H2 ##

### This is an H3 ######

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
> 
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.


> This is the first level of quoting.
>
> > This is nested blockquote.
>
> Back to the first level.

> ## This is a header.
> 
> 1.   This is the first list item.
> 2.   This is the second list item.
> 
> Here's some example code:
> 
>     return shell_exec("echo $input | $markdown_script");


return a

    return a
`
    return a
    
1.  Bird
1.  McHale
1.  Parish
or even:

3. Bird
1. McHale
8. Parish


*   Bird
*   Magic
will turn into:

        <ul>
        <li>Bird</li>
        <li>Magic</li>
        </ul>
But this:

*   Bird

*   Magic
will turn into:

        <ul>
        <li><p>Bird</p></li>
        <li><p>Magic</p></li>
        </ul>

1986. What a great season.


1986\. What a great season.

* * *

***

*****

- - -

---------------------------------------

This is [an example] [id] reference-style link.

[id]: http://example.com/  "Optional Title Here"


[Google][]
And then define the link:
[Google]: http://google.com/
        [Google][]
        [Google]: http://google.com/
        
*single asterisks*

_single underscores_

**double asterisks**

__double underscores__

Use the `printf()` function.



    ![OSX Server][osx]

    [osx]: https://github.com/kikitux/kikitux.github.com/raw/master/img/Server.png "Osx Server"

    ![OSX Server][]

    [OSX Server]: https://github.com/kikitux/kikitux.github.com/raw/master/img/Server.png

<http://example.com/>

<address@example.com>