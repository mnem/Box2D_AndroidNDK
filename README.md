Another port of the [Box2D][] physics engine to Android.

Rather than converting [Box2D][] to Java, this port uses the [Android NDK][] to compile the (almost) unaltered [Box2D][] C code, and then provides a JNI wrapper around it for use in normal Android applications.

I'm working on the assumption that this will be faster than a pure Java port, but best wait until I've finished it all and have some measurements to prove or disprove that assumption...

In the meantime, why not have some ASCII art?

    -=[ scaffolding to the moon ]=-  7/97

                 ___
          ~*  .'`  _\
             /  (o/   *
       *    |     _\     *
             \  '==. *
    jgs   *   '.____\   ~*

        *     ~*       
                       *
                \O
          *      |\
                /|
           |____\|___|
           |`'-.:.-'`|
           |_.-':'-._|
          O|----:----|
         /_|`'-.:.-'`|
         \/|_.-':'-._|
          \|----:----|
           |`'-.:.-'`|
           |_.-':'-._|
           |----:----|
           |`'-.:.-'`|
           |_.-':'-._|
           |----:----|
           |`'-.:.-'`|
           |_.-':'-._|
           |----:----|
           |`'-.:.-'`|
           |_.-':'-._|
           |----:----|
           |`'-.:.-'`|
           |_.-':'-._|
      jgs  |----:----|

[ASCII Art Source][]

[Box2D]: http://box2d.org/
[Android NDK]: http://developer.android.com/sdk/ndk/index.html
[ASCII Art Source]: http://www.geocities.com/SoHo/7373/celestal.htm