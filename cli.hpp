#pragma once

#include <string>
#include <vector>

namespace cli {
    std::string output_file;
    std::string input_file;

    bool print_version;
    bool generate_state = true;

    void parse(int argc, const char* argv[]) {
        std::string config;

        for (int i = 1; i < argc; i++) {
            config = argv[i];

            if ((config == "-o") || (config == "--output"      )) { output_file = argv[++i]; continue; }
            if ((config == "-i") || (config == "--input"       )) { input_file = argv[++i]; continue; }
            if ((config == "-v") || (config == "--version"     )) { print_version = true; continue; }
            if ((config == "-S") || (config == "--no-gen-state")) { generate_state = false; continue; }
            if ((config == "-s") || (config == "--gen-state"   )) { generate_state = true; continue; }

            input_file = argv[i];
        }
    }
}