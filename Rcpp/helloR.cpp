// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4;  tab-width: 8; -*-
//
// Simple example showing how to do the standard 'hello, world' using embedded R
//
// Copyright (C) 2009 Dirk Eddelbuettel
// Copyright (C) 2010 Dirk Eddelbuettel and Romain Francois
//
// GPL'ed

#include <RInside.h> // for the embedded R via RInside

int main(int argc, char *argv[])
{
    RInside R(argc, argv); // create an embedded R instance

    std::string txt = "Hello, world!\n"; // assign a standard C++ string to 'txt'
    R["txt"] = txt;                      // assign string var to R variable 'txt'

    std::string evalstr = "source('hello.R')";
    R.parseEvalQ(evalstr); // eval the init string, ignoring any returns

    // for (int i = 0; i < 1e1; i++)
    // {
    //     R.parseEvalQ(evalstr); // eval the init string, ignoring any returns
    // }
    // evalstr = "txt <- \"foo\\n\"";
    // for (int i = 0; i < 1e1; i++)
    // {
    //     R.parseEvalQ(evalstr); // eval the init string, ignoring any returns
    // }
    // evalstr = "cat(txt)";
    // for (int i = 0; i < 1e1; i++)
    // {
    //     R.parseEvalQ(evalstr); // eval the init string, ignoring any returns
    // }
    exit(0);
}
