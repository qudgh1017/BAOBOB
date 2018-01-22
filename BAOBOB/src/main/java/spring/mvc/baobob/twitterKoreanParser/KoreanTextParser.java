package spring.mvc.baobob.twitterKoreanParser;

import java.util.List;

import com.twitter.penguin.korean.TwitterKoreanProcessorJava;
import com.twitter.penguin.korean.phrase_extractor.KoreanPhraseExtractor;
import com.twitter.penguin.korean.tokenizer.KoreanTokenizer;

import scala.collection.Seq;


/*
 * Twitter Korean Text - Scala library to process Korean text
 *
 * Copyright 2014 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

public class KoreanTextParser {

	public static CharSequence getNormalized(String text) {
		return TwitterKoreanProcessorJava.normalize(text);
	}
	
	//  ----- token start
	public static Seq<KoreanTokenizer.KoreanToken> getTokens(String text) {
		return TwitterKoreanProcessorJava.tokenize(getNormalized(text));
	}
	
	public static List<String> getKoreanTokens(Seq<KoreanTokenizer.KoreanToken> tokens) {
		return TwitterKoreanProcessorJava.tokensToJavaStringList(tokens);
	}
	
	public static List<com.twitter.penguin.korean.KoreanTokenJava> getTokensToJavaKoreanTokenList(Seq<KoreanTokenizer.KoreanToken> tokens) {
		return TwitterKoreanProcessorJava.tokensToJavaKoreanTokenList(tokens);
	}
	//  ----- token end
	
	// ----- streaming start
	public static Seq<KoreanTokenizer.KoreanToken> getStemmed(Seq<KoreanTokenizer.KoreanToken> tokens) {
		return TwitterKoreanProcessorJava.stem(tokens);
	}
	
	public static List<String> getTokenToJavaList(Seq<KoreanTokenizer.KoreanToken> stemmed) {
		return TwitterKoreanProcessorJava.tokensToJavaStringList(stemmed);
	}
	// ----- streaming end
	
	// Phrase extraction
	public static List<KoreanPhraseExtractor.KoreanPhrase> getPhrases(Seq<KoreanTokenizer.KoreanToken> tokens) {
		return TwitterKoreanProcessorJava.extractPhrases(tokens, true, true);
	}
}

