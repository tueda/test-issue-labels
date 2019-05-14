package com.github.tueda.test1;

import static com.google.common.truth.Truth.assertThat;

import org.junit.jupiter.api.Test;

public class LibraryTest {
  @Test
  public void add() {
    Library a = new Library();
    assertThat(a.add(2, 3)).isEqualTo(5);
  }

  @Test
  public void sub() {
    Library a = new Library();
    assertThat(a.sub(3, 2)).isEqualTo(1);
  }
}
