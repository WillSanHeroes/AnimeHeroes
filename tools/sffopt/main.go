package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Fprintf(os.Stderr, "uso: sffopt naruto|ichigo|allstar <arquivos>\n")
		os.Exit(2)
	}
	var err error
	switch os.Args[1] {
	case "naruto":
		err = runNaruto(os.Args[2])
	case "ichigo":
		err = runIchigo(os.Args[2], os.Args[3])
	case "allstar":
		err = runAllstar(os.Args[2])
	case "oxi":
		err = runOxi(os.Args[2], os.Args[3])
	default:
		err = fmt.Errorf("comando desconhecido %s", os.Args[1])
	}
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func progress(name string) func(int, int) {
	return func(done, total int) {
		fmt.Fprintf(os.Stderr, "\r%s %d/%d", name, done, total)
		if done == total {
			fmt.Fprintln(os.Stderr)
		}
	}
}

func runNaruto(path string) error {
	sf, err := readSFFV2(path)
	if err != nil {
		return err
	}
	if err := recompressSprites(sf, progress("naruto")); err != nil {
		return err
	}
	return sf.write(path)
}

func runIchigo(sffPath, airPath string) error {
	sf, err := readSFFV2(sffPath)
	if err != nil {
		return err
	}
	factors, err := scaleICHIGO(sf, progress("ichigo"))
	if err != nil {
		return err
	}
	if err := sf.write(sffPath); err != nil {
		return err
	}
	return rewriteAIR(airPath, factors)
}

func runAllstar(path string) error {
	return convertAllstar(path, path, progress("allstar"))
}
