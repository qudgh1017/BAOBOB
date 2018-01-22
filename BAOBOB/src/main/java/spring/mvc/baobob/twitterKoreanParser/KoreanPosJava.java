package spring.mvc.baobob.twitterKoreanParser;

public enum KoreanPosJava {
	// Word leved POS
    Noun, Verb, Adjective,
    Adverb, Determiner, Exclamation,
    Josa, Eomi, PreEomi, Conjunction,
    NounPrefix, VerbPrefix, Suffix, Unknown,

    // Chunk level POS
    Korean, Foreign, Number, KoreanParticle, Alpha,
    Punctuation, Hashtag, ScreenName,
    Email, URL, CashTag,

    // Functional POS
    Space, Others,

    ProperNoun;
}
