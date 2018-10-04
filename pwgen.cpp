// Copyright © 2018 Gene Hightower

// This program is distributed under the terms of the GNU General
// Public License.  See the file COPYING.

#include <fstream>
#include <iostream>
#include <random>
#include <string_view>

#include <boost/xpressive/xpressive.hpp>

#include <gflags/gflags.h>

// DEFINE_string(wordlist, "eff_large_wordlist.txt", "file name of word list");
DEFINE_string(wordlist, "diceware.wordlist.txt", "file name of word list");

// See <http://world.std.com/~reinhold/dicewarefaq.html#howlong>
DEFINE_int32(nwords, 6, "number of words");

// clang-format off
auto conv6(std::string const& arg)
{
  return (arg[0] - '1') * 6 * 6 * 6 * 6
       + (arg[1] - '1') * 6 * 6 * 6
       + (arg[2] - '1') * 6 * 6
       + (arg[3] - '1') * 6
       + (arg[4] - '1');
}
// clang-format on

int main(int argc, char **argv) {
  std::ios::sync_with_stdio(false);

  gflags::ParseCommandLineFlags(&argc, &argv, true);

  using namespace boost::xpressive;

  // clang-format off
  boost::xpressive::sregex re_roll = range('1', '6')
                                  >> range('1', '6')
                                  >> range('1', '6')
                                  >> range('1', '6')
                                  >> range('1', '6');
  // clang-format on

  boost::xpressive::sregex re_line = (s1 = re_roll) >> '\t' >> (s2 = +~_ln);

  std::ifstream f{FLAGS_wordlist};

  if (!f.is_open())
    perror(("error while opening file " + FLAGS_wordlist).c_str());

  std::vector<std::string> wds;
  wds.reserve(6 * 6 * 6 * 6 * 6);

  std::string line{};
  for (auto lineno = 1; std::getline(f, line); ++lineno) {
    smatch matches;
    if (regex_match(line, matches, re_line)) {
      auto nth = conv6(matches[1]) + 1;
      if (nth != lineno) {
        std::cerr << FLAGS_wordlist << ':' << lineno;
        std::cerr << " wrong roll " << nth << "\n";
        return 1;
      }
      wds.push_back(matches[2]);
    } else {
      std::cerr << FLAGS_wordlist << ':' << lineno;
      std::cerr << " malformed line \"" << line << "\"\n";
      return 2;
    }
  }

  if (f.bad())
    perror(("error while reading file " + FLAGS_wordlist).c_str());
  f.close();

  if (wds.size() != 6 * 6 * 6 * 6 * 6) {
    std::cerr << "wrong number of words " << wds.size() << '\n';
    return 3;
  }

  if (argc == 1) {
    auto dis = std::uniform_int_distribution<>(0, wds.size() - 1);
    std::random_device rd;
    for (auto i = 0; i < FLAGS_nwords; ++i) {
      auto nth = dis(rd);
      std::cout << wds[nth] << ' ';
    }
  } else {
    for (auto i = 1; i < argc; ++i) {
      std::string arg = argv[i];
      smatch matches;
      if (regex_match(arg, matches, re_roll)) {
        auto nth = conv6(matches[0]);
        std::cout << wds[nth] << ' ';
      }
    }
  }
  std::cout << '\n';

  return 0;
}
