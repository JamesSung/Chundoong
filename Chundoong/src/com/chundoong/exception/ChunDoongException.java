package com.chundoong.exception;

public class ChunDoongException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private static final String CAUSED_BY = "\nCaused by: ";

    private Throwable cause = null;


    public ChunDoongException(String msg) {
        super(msg);
    }

    public ChunDoongException(String msg, Throwable cause) {
        super(msg);
        this.cause = cause;
    }
    
    public ChunDoongException(Throwable cause) {
        this.cause = cause;
    }

    public Throwable getCause() {
        return cause;
    }

    public String toString() {
        if (cause == null) {
            return super.toString();
        } else {
            return super.toString() + CAUSED_BY + cause.toString();
        }
    }

    public void printStackTrace() {
        super.printStackTrace();
        if (cause != null) {
            System.err.println(CAUSED_BY);
            cause.printStackTrace();
        }
    }

    public void printStackTrace(java.io.PrintStream ps) {
        super.printStackTrace(ps);
        if (cause != null) {
            ps.println(CAUSED_BY);
            cause.printStackTrace(ps);
        }
    }

    public void printStackTrace(java.io.PrintWriter pw) {
        super.printStackTrace(pw);
        if (cause != null) {
            pw.println(CAUSED_BY);
            cause.printStackTrace(pw);
        }
    }

}
