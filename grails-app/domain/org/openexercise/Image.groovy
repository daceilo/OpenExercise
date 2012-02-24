package org.openexercise

class Image {
    private static final int TEN_MEG_IN_BYTES = 1024*1024*10
    byte[] data
    String fileName
    String type
    int size

    static belongsTo = [exercise:Exercise]

    static constraints = {
        data(nullable: false, minSize: 1, maxSize: TEN_MEG_IN_BYTES )
        fileName(display: false, nullable: false, blank: false )
        size(display: false, nullable: false )
        type(display: false, nullable: false, blank: false)
    }

    String toString() {
        fileName
    }
}
