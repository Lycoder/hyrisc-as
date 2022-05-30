#pragma once

#include <string>
#include <vector>

namespace cli {
    void parse(int argc, const char* argv[]) {
        std::string config;

        for (int i = 1; i < argc; i++) {
            config = argv[i];
        }
    }
}